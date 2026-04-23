// log_manager/log_manager.h
#pragma once

extern "C" void init_logging();
extern "C" void log_to_file(const char* fmt, ...);
