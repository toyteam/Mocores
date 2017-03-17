TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    database/resultset.cpp \
    database/sqlmanager.cpp \
    database/statement.cpp \
    filesystem/file.cpp \
    filesystem/filesystem.cpp \
    filesystem/iomethod.cpp \
    net/mocores_socket.cpp \
    thread/mocores_thread.cpp \
    clio.cpp \
    errcode.cpp \
    logerror.cpp \
    mocores_time.cpp \
    mocoresinstance.cpp \
    settings.cpp \
    sqlite/sqlite3.c \
    database/sqlconnection.cpp \
    databasemodule.cpp \
    nodelistenermodule.cpp \
    net/libevent-2.1.8-stable/sample/dns-example.c \
    net/libevent-2.1.8-stable/sample/event-read-fifo.c \
    net/libevent-2.1.8-stable/sample/hello-world.c \
    net/libevent-2.1.8-stable/sample/hostcheck.c \
    net/libevent-2.1.8-stable/sample/http-connect.c \
    net/libevent-2.1.8-stable/sample/http-server.c \
    net/libevent-2.1.8-stable/sample/https-client.c \
    net/libevent-2.1.8-stable/sample/le-proxy.c \
    net/libevent-2.1.8-stable/sample/openssl_hostname_validation.c \
    net/libevent-2.1.8-stable/sample/signal-test.c \
    net/libevent-2.1.8-stable/sample/time-test.c \
    net/libevent-2.1.8-stable/test/bench.c \
    net/libevent-2.1.8-stable/test/bench_cascade.c \
    net/libevent-2.1.8-stable/test/bench_http.c \
    net/libevent-2.1.8-stable/test/bench_httpclient.c \
    net/libevent-2.1.8-stable/test/regress.c \
    net/libevent-2.1.8-stable/test/regress.gen.c \
    net/libevent-2.1.8-stable/test/regress_buffer.c \
    net/libevent-2.1.8-stable/test/regress_bufferevent.c \
    net/libevent-2.1.8-stable/test/regress_dns.c \
    net/libevent-2.1.8-stable/test/regress_et.c \
    net/libevent-2.1.8-stable/test/regress_finalize.c \
    net/libevent-2.1.8-stable/test/regress_http.c \
    net/libevent-2.1.8-stable/test/regress_iocp.c \
    net/libevent-2.1.8-stable/test/regress_listener.c \
    net/libevent-2.1.8-stable/test/regress_main.c \
    net/libevent-2.1.8-stable/test/regress_minheap.c \
    net/libevent-2.1.8-stable/test/regress_rpc.c \
    net/libevent-2.1.8-stable/test/regress_ssl.c \
    net/libevent-2.1.8-stable/test/regress_testutils.c \
    net/libevent-2.1.8-stable/test/regress_thread.c \
    net/libevent-2.1.8-stable/test/regress_util.c \
    net/libevent-2.1.8-stable/test/regress_zlib.c \
    net/libevent-2.1.8-stable/test/test-changelist.c \
    net/libevent-2.1.8-stable/test/test-closed.c \
    net/libevent-2.1.8-stable/test/test-dumpevents.c \
    net/libevent-2.1.8-stable/test/test-eof.c \
    net/libevent-2.1.8-stable/test/test-fdleak.c \
    net/libevent-2.1.8-stable/test/test-init.c \
    net/libevent-2.1.8-stable/test/test-ratelim.c \
    net/libevent-2.1.8-stable/test/test-time.c \
    net/libevent-2.1.8-stable/test/test-weof.c \
    net/libevent-2.1.8-stable/test/tinytest.c \
    net/libevent-2.1.8-stable/arc4random.c \
    net/libevent-2.1.8-stable/buffer.c \
    net/libevent-2.1.8-stable/buffer_iocp.c \
    net/libevent-2.1.8-stable/bufferevent.c \
    net/libevent-2.1.8-stable/bufferevent_async.c \
    net/libevent-2.1.8-stable/bufferevent_filter.c \
    net/libevent-2.1.8-stable/bufferevent_openssl.c \
    net/libevent-2.1.8-stable/bufferevent_pair.c \
    net/libevent-2.1.8-stable/bufferevent_ratelim.c \
    net/libevent-2.1.8-stable/bufferevent_sock.c \
    net/libevent-2.1.8-stable/devpoll.c \
    net/libevent-2.1.8-stable/epoll.c \
    net/libevent-2.1.8-stable/epoll_sub.c \
    net/libevent-2.1.8-stable/evdns.c \
    net/libevent-2.1.8-stable/event.c \
    net/libevent-2.1.8-stable/event_iocp.c \
    net/libevent-2.1.8-stable/event_tagging.c \
    net/libevent-2.1.8-stable/evmap.c \
    net/libevent-2.1.8-stable/evport.c \
    net/libevent-2.1.8-stable/evrpc.c \
    net/libevent-2.1.8-stable/evthread.c \
    net/libevent-2.1.8-stable/evthread_pthread.c \
    net/libevent-2.1.8-stable/evthread_win32.c \
    net/libevent-2.1.8-stable/evutil.c \
    net/libevent-2.1.8-stable/evutil_rand.c \
    net/libevent-2.1.8-stable/evutil_time.c \
    net/libevent-2.1.8-stable/http.c \
    net/libevent-2.1.8-stable/kqueue.c \
    net/libevent-2.1.8-stable/listener.c \
    net/libevent-2.1.8-stable/log.c \
    net/libevent-2.1.8-stable/poll.c \
    net/libevent-2.1.8-stable/select.c \
    net/libevent-2.1.8-stable/signal.c \
    net/libevent-2.1.8-stable/strlcpy.c \
    net/libevent-2.1.8-stable/win32select.c

DISTFILES += \
    mocores.ini \
    net/libevent-2.1.8-stable/m4/ac_backport_259_ssizet.m4 \
    net/libevent-2.1.8-stable/m4/acx_pthread.m4 \
    net/libevent-2.1.8-stable/m4/libevent_openssl.m4 \
    net/libevent-2.1.8-stable/m4/libtool.m4 \
    net/libevent-2.1.8-stable/m4/ltoptions.m4 \
    net/libevent-2.1.8-stable/m4/ltsugar.m4 \
    net/libevent-2.1.8-stable/m4/ltversion.m4 \
    net/libevent-2.1.8-stable/m4/lt~obsolete.m4 \
    net/libevent-2.1.8-stable/m4/ntp_pkg_config.m4 \
    net/libevent-2.1.8-stable/aclocal.m4 \
    net/libevent-2.1.8-stable/test/rpcgen_wrapper.sh \
    net/libevent-2.1.8-stable/test/test.sh \
    net/libevent-2.1.8-stable/autogen.sh \
    net/libevent-2.1.8-stable/compile \
    net/libevent-2.1.8-stable/config.guess \
    net/libevent-2.1.8-stable/config.sub \
    net/libevent-2.1.8-stable/configure \
    net/libevent-2.1.8-stable/depcomp \
    net/libevent-2.1.8-stable/install-sh \
    net/libevent-2.1.8-stable/ltmain.sh \
    net/libevent-2.1.8-stable/missing \
    net/libevent-2.1.8-stable/test-driver \
    net/libevent-2.1.8-stable/include/include.am \
    net/libevent-2.1.8-stable/sample/include.am \
    net/libevent-2.1.8-stable/test/include.am \
    net/libevent-2.1.8-stable/test/regress.rpc \
    net/libevent-2.1.8-stable/ChangeLog-1.4 \
    net/libevent-2.1.8-stable/ChangeLog-2.0 \
    net/libevent-2.1.8-stable/config.h.in \
    net/libevent-2.1.8-stable/Doxyfile \
    net/libevent-2.1.8-stable/libevent.pc.in \
    net/libevent-2.1.8-stable/libevent_core.pc.in \
    net/libevent-2.1.8-stable/libevent_extra.pc.in \
    net/libevent-2.1.8-stable/libevent_openssl.pc.in \
    net/libevent-2.1.8-stable/libevent_pthreads.pc.in \
    net/libevent-2.1.8-stable/LICENSE \
    net/libevent-2.1.8-stable/whatsnew-2.0.txt \
    net/libevent-2.1.8-stable/whatsnew-2.1.txt \
    net/libevent-2.1.8-stable/ChangeLog \
    net/libevent-2.1.8-stable/test/check-dumpevents.py \
    net/libevent-2.1.8-stable/event_rpcgen.py

HEADERS += \
    database/mocores_sql.h \
    database/resultset.h \
    database/sqlmanager.h \
    database/statement.h \
    filesystem/file.h \
    filesystem/filesystem.h \
    filesystem/iomethod.h \
    net/mocores_socket.h \
    sqlite/sqlite3.h \
    sqlite/sqlite3ext.h \
    thread/mocores_thread.h \
    clio.h \
    errcode.h \
    logerror.h \
    mocores_time.h \
    mocoresinstance.h \
    platform.h \
    settings.h \
    database/sqlconnection.h \
    databasemodule.h \
    nodelistenermodule.h \
    net/libevent-2.1.8-stable/compat/sys/queue.h \
    net/libevent-2.1.8-stable/include/event2/buffer.h \
    net/libevent-2.1.8-stable/include/event2/buffer_compat.h \
    net/libevent-2.1.8-stable/include/event2/bufferevent.h \
    net/libevent-2.1.8-stable/include/event2/bufferevent_compat.h \
    net/libevent-2.1.8-stable/include/event2/bufferevent_ssl.h \
    net/libevent-2.1.8-stable/include/event2/bufferevent_struct.h \
    net/libevent-2.1.8-stable/include/event2/dns.h \
    net/libevent-2.1.8-stable/include/event2/dns_compat.h \
    net/libevent-2.1.8-stable/include/event2/dns_struct.h \
    net/libevent-2.1.8-stable/include/event2/event.h \
    net/libevent-2.1.8-stable/include/event2/event_compat.h \
    net/libevent-2.1.8-stable/include/event2/event_struct.h \
    net/libevent-2.1.8-stable/include/event2/http.h \
    net/libevent-2.1.8-stable/include/event2/http_compat.h \
    net/libevent-2.1.8-stable/include/event2/http_struct.h \
    net/libevent-2.1.8-stable/include/event2/keyvalq_struct.h \
    net/libevent-2.1.8-stable/include/event2/listener.h \
    net/libevent-2.1.8-stable/include/event2/rpc.h \
    net/libevent-2.1.8-stable/include/event2/rpc_compat.h \
    net/libevent-2.1.8-stable/include/event2/rpc_struct.h \
    net/libevent-2.1.8-stable/include/event2/tag.h \
    net/libevent-2.1.8-stable/include/event2/tag_compat.h \
    net/libevent-2.1.8-stable/include/event2/thread.h \
    net/libevent-2.1.8-stable/include/event2/util.h \
    net/libevent-2.1.8-stable/include/event2/visibility.h \
    net/libevent-2.1.8-stable/include/evdns.h \
    net/libevent-2.1.8-stable/include/event.h \
    net/libevent-2.1.8-stable/include/evhttp.h \
    net/libevent-2.1.8-stable/include/evrpc.h \
    net/libevent-2.1.8-stable/include/evutil.h \
    net/libevent-2.1.8-stable/sample/hostcheck.h \
    net/libevent-2.1.8-stable/sample/openssl_hostname_validation.h \
    net/libevent-2.1.8-stable/test/regress.gen.h \
    net/libevent-2.1.8-stable/test/regress.h \
    net/libevent-2.1.8-stable/test/regress_testutils.h \
    net/libevent-2.1.8-stable/test/regress_thread.h \
    net/libevent-2.1.8-stable/test/tinytest.h \
    net/libevent-2.1.8-stable/test/tinytest_local.h \
    net/libevent-2.1.8-stable/test/tinytest_macros.h \
    net/libevent-2.1.8-stable/WIN32-Code/nmake/event2/event-config.h \
    net/libevent-2.1.8-stable/WIN32-Code/nmake/evconfig-private.h \
    net/libevent-2.1.8-stable/WIN32-Code/tree.h \
    net/libevent-2.1.8-stable/bufferevent-internal.h \
    net/libevent-2.1.8-stable/changelist-internal.h \
    net/libevent-2.1.8-stable/configure.ac \
    net/libevent-2.1.8-stable/defer-internal.h \
    net/libevent-2.1.8-stable/epolltable-internal.h \
    net/libevent-2.1.8-stable/evbuffer-internal.h \
    net/libevent-2.1.8-stable/evconfig-private.h \
    net/libevent-2.1.8-stable/evconfig-private.h.in \
    net/libevent-2.1.8-stable/event-internal.h \
    net/libevent-2.1.8-stable/evmap-internal.h \
    net/libevent-2.1.8-stable/evrpc-internal.h \
    net/libevent-2.1.8-stable/evsignal-internal.h \
    net/libevent-2.1.8-stable/evthread-internal.h \
    net/libevent-2.1.8-stable/ht-internal.h \
    net/libevent-2.1.8-stable/http-internal.h \
    net/libevent-2.1.8-stable/iocp-internal.h \
    net/libevent-2.1.8-stable/ipv6-internal.h \
    net/libevent-2.1.8-stable/kqueue-internal.h \
    net/libevent-2.1.8-stable/log-internal.h \
    net/libevent-2.1.8-stable/make-event-config.sed \
    net/libevent-2.1.8-stable/minheap-internal.h \
    net/libevent-2.1.8-stable/mm-internal.h \
    net/libevent-2.1.8-stable/openssl-compat.h \
    net/libevent-2.1.8-stable/ratelim-internal.h \
    net/libevent-2.1.8-stable/strlcpy-internal.h \
    net/libevent-2.1.8-stable/time-internal.h \
    net/libevent-2.1.8-stable/util-internal.h
