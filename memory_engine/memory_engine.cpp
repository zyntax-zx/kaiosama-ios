#include "memory_engine.h"
#include "../utils/utils.h"

namespace memory_engine {
    void init() {
        log_to_file("[MEMORY] Engine inicializado");
    }

    bool write_float(uint64_t addr, float value) {
        log_to_file("[MEMORY] Write 0x%llx = %.2f", addr, value);
        return true;
    }
}
