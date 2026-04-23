#pragma once
#include <cstdint>

namespace memory_engine {
    void init();
    bool write_float(uint64_t addr, float value);
}
