// overlay/imgui_overlay.mm
#import <UIKit/UIKit.h>
#include "imgui.h"
#include "imgui_impl_metal.h"
#include "imgui_impl_ios.h"
#include "../utils/utils.h"

bool show_menu = true;
bool esp_enabled = false;
bool aimbot_enabled = false;

void draw_esp() {
    if (!esp_enabled) return;
    ImGui::GetBackgroundDrawList()->AddText(ImVec2(50, 50), IM_COL32(0, 255, 0, 255), "ESP Activado - Knives Out");
    // Aquí irá el dibujo real de cajas, nombres, distancia, etc.
}

void render_imgui() {
    ImGui::NewFrame();

    if (show_menu) {
        ImGui::Begin("Enhanced Hacker - Knives Out", &show_menu);
        ImGui::Text("iOS 26 - ESign mode");

        if (ImGui::Checkbox("ESP", &esp_enabled)) {
            log_to_file("[ESP] %s", esp_enabled ? "Activado" : "Desactivado");
        }
        if (ImGui::Checkbox("Aimbot", &aimbot_enabled)) {
            log_to_file("[AIMBOT] %s", aimbot_enabled ? "Activado" : "Desactivado");
        }

        ImGui::End();
    }

    draw_esp();
    ImGui::Render();
}

extern "C" void init_imgui_overlay() {
    log_to_file("[IMGUI] Overlay inicializado - Menú ImGui listo");
}
