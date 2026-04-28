#pragma once

// Disable all timers
// #define DISABLE_TIMING

namespace ML {
namespace Config {
constexpr bool ENABLE_SIMD = false;
constexpr bool FANCY_LOGGING = true;
constexpr bool ENABLE_LAYER_TIMING = true;
// Toggle optimized math paths; false uses the simplest reference implementations
constexpr bool ENABLE_OPTIMIZED_LINEAR = true;
// Toggle streaming attention to avoid full score matrices
constexpr bool ENABLE_STREAMING_ATTENTION = true;
// Toggle multi-run benchmarking; false runs a single reference pass
constexpr bool ENABLE_BENCHMARK_RUNS = true;

// Floating Point Compare Epsilon
constexpr float EPSILON = 0.001;
} // namespace Config
} // namespace ML::Config
