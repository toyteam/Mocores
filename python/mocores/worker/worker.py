import mocores.core.actor
import mocores.core.util
import mocores.core.net.protocol
import mocores.core.net.worker_server
import mocores.core.actor_pool
import mocores.core.worker_thread
import mocores.core.logging as logging
from mocores.core.membership_table import(MembershipTable, MembershipTableEntry)

import time
import asyncio
import threading

class Worker(object):
    def __init__(self, cluster_id, service_id, ip, port, single_node_mode=False):
        print("new worker")
        self.cluster_id = cluster_id
        self.service_id = service_id
        self.single_node_mode = single_node_mode
        self.ip = ip
        self.port = port
        self.start_time = time.strftime('%Y-%m-%d-%H-%M-%S', time.gmtime(time.time()))
        self.messages = mocores.core.util.MessageQueue()
        self.worker_threads = []
        self.membership_table = MembershipTable()

        logging.init_logging()

    async def run(self):
        logging.info("start server")

        # add self to membership table
        if self.single_node_mode:
            self.membership_table.add_entry(
                MembershipTableEntry(
                    self.cluster_id,
                    self.ip,
                    self.port,
                    self.start_time,
                    True))
        else:
            pass

        logging.info("start worker threads")
        for i in range(4):
            self.worker_threads.append(mocores.core.worker_thread.WorkerThread())
            self.worker_threads[i].start()

        logging.debug("wait for connections")
        tcp_server = mocores.core.net.worker_server.TcpServer(worker=self)
        await tcp_server.start_up("localhost", self.port)

    def get_actor(self, actor_type, actor_id):
        actor_ref_type = mocores.core.actor.actor_ref(actor_type)
        actor_class = actor_type.__module__ + "." + actor_type.__name__
        return actor_ref_type(actor_class, actor_id)
        