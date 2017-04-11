


/*
    © 2016-2017 mocores
    This file is distributed under the MIT liscense.
    See LICENSE for details.
*/
#ifndef LOGGER_H
#define LOGGER_H

#include<string>
#include<queue>
#include<chrono>
#include<exception>
#include<ostream>
#include<memory>
#include<cassert>
#include<ctime>

#include"logmsg.h"
#include"loglayout.h"
#include"logappender.h"
#include"../thread/mocores_mutex.h"
#include"../thread/mocores_thread.h"
#include"../thread/mocores_condition_variable.h"

#include"../container/linkedblockingqueue.h"

namespace mocores
{
    /*!
     * \brief The Logger class
     */
    class Logger
    {
    public:
        using TimePoint=std::chrono::time_point<std::chrono::system_clock, std::chrono::nanoseconds>;
        using AppenderPtr=std::shared_ptr<LogAppender>;
        Logger()
            :log_queue(1*1000000),running(false),log_thread(nullptr),appender(new ConsoleAppender){}
        virtual ~Logger()
        {
            delete log_thread;
        }
        Logger(const Logger &other)=delete;
        Logger operator =(const Logger &other)=delete;
        void setName(const char * name)
        {
            assert(running==false);
            logger_name=name;
        }
        void setLayout(const LogLayout& _layout)
        {
            assert(running==false);
            layout=_layout;
        }
        bool configure()
        {
            assert(running==false);
            return true;
        }
        bool configureFromMem(const char *)
        {
            assert(running==false);
            return true;
        }
        bool configureFromFile(const char *)
        {
            assert(running==false);
            return true;
        }
        //
        void off(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("OFF"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }

        void fatal(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("FATAL"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }
        void error(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("ERROR"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }
        void warn(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("WARN"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }
        void info(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("INFO"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }
        void debug(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("DEBUG"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }
        void all(const std::string & msg)
        {
            LogMsg logmsg(LogLevel("ALL"),msg,mocores::this_thread::get_id());
            log_queue.put(layout.getMsgText(logmsg));
        }

        void start()
        {
            assert(running==false);
            running=true;
            start_time=std::chrono::system_clock::now();
            layout.setStartTime(start_time);
            appender->open();
            log_thread=new mocores::Thread(std::bind(&Logger::run, this));
        }
        void end()
        {
            {
              mocores::UniqueLock<mocores::Mutex> lock(queue_mtx);
              UNUSED(lock);
              running = false;
            }
            assert(log_thread!=nullptr);
            log_thread->join();
            delete log_thread;
            log_thread=nullptr;
        }
        /*!
         * \brief setAppender
         * \param app
         * \note We will delete appender. The Appender must be created in heap.
         */
        template<class T>
        void setAppender(const T& app)
        {
            assert(running==false);
            appender=std::make_shared<T>(app);
        }
    protected:
        void run()
        {
            try
            {
              clock_t last_time=clock();
			  std::string buffer;
              buffer.reserve(1024*1024*4);
              while (running)
              {
                  clock_t now_time=clock();
                  if(now_time-last_time>=3*1000)
                  {
					  appender->append(buffer);
                      appender->flush();
					  buffer.clear();
                      last_time=now_time;
                  }
				  if (buffer.length()>1024*1024*4)
				  {
					  appender->append(buffer);
                      //appender->flush();
					  buffer.clear();
				  }
                  if(!log_queue.empty())
                  {
                      buffer += log_queue.take();
                  }
                  else
                  {
                      mocores::this_thread::sleep_for(std::chrono::milliseconds(1));
                  }
              }
            }
            catch (const std::exception& ex)
            {
                std::cerr<<"exception caught in Logger %s\n"<<logger_name<<std::endl;
                std::cerr<<"reason: %s\n"<<ex.what()<<std::endl;
                abort();
            }
            catch (...)
            {
                std::cerr<<"unknown exception caught in Logger %s\n"<<logger_name<<std::endl;
                throw; // rethrow
            }
        }

    protected:
        std::string logger_name;
        mocores::LinkedBlockingQueue<std::string> log_queue;
        mocores::Mutex queue_mtx;
        bool running;
        TimePoint start_time;
        mocores::Thread * log_thread;
        LogLayout layout;
        AppenderPtr appender;
    };
}


#endif // LOGGER_H