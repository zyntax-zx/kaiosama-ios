// main.cpp
#include "utils/utils.h"
#include "core_server/server.h"
#include "hook_engine/hook_engine.h"
#include "memory_engine/memory_engine.h"
#include "log_manager/log_manager.h"

extern "C" void init_exploit_framework();
extern "C" void init_imgui_overlay();

__attribute__((constructor))
static void init_framework() {
    init_logging();                    // Log en Documents
    log_to_file("🚀 kaiosama-ios.dylib cargado en iOS 26");

    memory_engine::init();
    hook_engine::init();
    init_exploit_framework();
    init_imgui_overlay();
    core_server::start_tcp_server();

    log_to_file("✅ Framework listo - Menú ImGui + ESP básico activado");
}
