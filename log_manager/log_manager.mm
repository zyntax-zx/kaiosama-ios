// log_manager/log_manager.mm
#import <Foundation/Foundation.h>
#include "../utils/utils.h"

static FILE* log_file = nullptr;

extern "C" void init_logging() {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsPath = [paths firstObject];
    NSString* logPath = [documentsPath stringByAppendingPathComponent:@"KAIOSAMA_LOGS.TXT"];

    log_file = fopen([logPath UTF8String], "a");

    if (log_file) {
        NSString* bundleID = [[NSBundle mainBundle] bundleIdentifier];
        log_to_file("🚀 kaiosama-ios.dylib cargado correctamente");
        log_to_file("[BUNDLE] App actual: %s", [bundleID UTF8String]);
        log_to_file("[LOG] Archivo creado en Documents del juego");
        log_to_file("[PATH] %s", [logPath UTF8String]);
    } else {
        log_to_file("❌ No se pudo crear el log en Documents");
    }
}

extern "C" void log_to_file(const char* fmt, ...) {
    if (!log_file) return;
    va_list args;
    va_start(args, fmt);
    vfprintf(log_file, fmt, args);
    va_end(args);
    fprintf(log_file, "\n");
    fflush(log_file);
}
