relaunch_sim

# ============================================================
# Clock and reset
# ============================================================
# 100 MHz clock: 10 ns period
add_force {/dequantization/clk} -radix hex {0 0ns} {1 5ns} -repeat_every 10ns

# Active-high reset
add_force {/dequantization/rst} -radix hex {1 0ns}
run 50ns
add_force {/dequantization/rst} -radix hex {0 0ns}

# ============================================================
# Default static signals
# ============================================================
# Start with downstream always ready
add_force {/dequantization/M_AXIS_TREADY} -radix hex {1 0ns}

# Default control: ReLU on, mid-range scale and zero-point
add_force {/dequantization/relu}    -radix hex {1 0ns}
add_force {/dequantization/q_scale} -radix hex {00f6c000 0ns} ;# +128
add_force {/dequantization/q_zero}  -radix hex {FF 0ns}       ;# -128 as signed

# Default AXIS idle
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000000 0ns}

run 50ns

# Helper comment: every "Test X" sends a sample or frame for you to inspect.
# Look for the cycle where M_AXIS_TVALID=1 and M_AXIS_TREADY=1 to read outputs.

# ============================================================
# Test 1: Simple positive input, ReLU on
# Expect: close to q_zero + small positive offset
# ============================================================


add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00002c76 0ns} ;# +64
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

add_force {/dequantization/relu}    -radix hex {1 0ns}
add_force {/dequantization/q_scale} -radix hex {00C3B000 0ns} ;# +128
add_force {/dequantization/q_zero}  -radix hex {FD 0ns}       ;# -128 as signed
run 10ns 


# ============================================================
# Test 2: Negative input, ReLU on (should clamp before adding zero)
# ============================================================
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {0000201D 0ns} ;# -64
add_force {/dequantization/S_AXIS_TID}    -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

add_force {/dequantization/relu}    -radix hex {1 0ns}
add_force {/dequantization/q_scale} -radix hex {01BF4000 0ns} ;# +128
add_force {/dequantization/q_zero}  -radix hex {FF 0ns}       ;# -128 as signed
run 10ns 

# ============================================================
# Test 3: Same negative input, ReLU off
# Checks that ReLU actually changes behavior
# ============================================================

add_force {/dequantization/S_AXIS_TDATA}  -radix hex {FFFFD604 0ns} ;# -64
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

# Restore ReLU on for later tests
add_force {/dequantization/relu} -radix hex {1 0ns}

# ============================================================
# Test 4: Zero and tiny values around 0
# Checks rounding and sign handling near zero
# ============================================================
# 4a: exact zero
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000000 0ns}
add_force {/dequantization/S_AXIS_TID}    -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 30ns

# 4b: small positive (LSB)
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000001 0ns}
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 30ns

# 4c: small negative (LSB)
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {FFFFFFFF 0ns} ;# -1
add_force {/dequantization/S_AXIS_TID}    -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

# ============================================================
# Test 5: High positive saturation
# Big positive input + larger scale to force top-end clipping
# ============================================================
add_force {/dequantization/q_scale} -radix hex {00000100 0ns} ;# 256
add_force {/dequantization/q_zero}  -radix hex {00 0ns}       ;# zero-point at 0

add_force {/dequantization/S_AXIS_TDATA}  -radix hex {7FFFFFFF 0ns} ;# large +ve
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

# ============================================================
# Test 6: Low negative saturation (ReLU off)
# ============================================================
add_force {/dequantization/relu} -radix hex {0 0ns}

add_force {/dequantization/S_AXIS_TDATA}  -radix hex {80000000 0ns} ;# large -ve
add_force {/dequantization/S_AXIS_TID}    -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

# Restore ReLU and mid-range config
add_force {/dequantization/relu}    -radix hex {1 0ns}
add_force {/dequantization/q_scale} -radix hex {00000080 0ns}
add_force {/dequantization/q_zero}  -radix hex {7F 0ns}       ;# +127 as signed

# ============================================================
# Test 7: Different zero-point (127)
# ============================================================
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000080 0ns} ;# +128
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 40ns

# ============================================================
# Test 8: Multi-beat frame (3 samples, TLAST on last)
# Checks TLAST/TID propagation across pipeline
# ============================================================
# Use small scale, zero-point zero for easier mental math
add_force {/dequantization/q_scale} -radix hex {00000080 0ns}
add_force {/dequantization/q_zero}  -radix hex {00 0ns}
add_force {/dequantization/relu}    -radix hex {1 0ns}

# Beat 0
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000010 0ns} ;# +16
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 10ns

# Beat 1
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {FFFFFFF0 0ns} ;# -16
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
# TVALID already 1 from previous beat
run 10ns

# Beat 2 (last)
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000000 0ns} ;# 0
add_force {/dequantization/S_AXIS_TID}    -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
run 10ns

# Deassert TVALID after frame
add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 80ns

# ============================================================
# Test 9: Backpressure – toggle M_AXIS_TREADY
# Ensures internal pipeline handles READY=0 cleanly
# ============================================================
# New config for visibility
add_force {/dequantization/q_scale} -radix hex {00000100 0ns}
add_force {/dequantization/q_zero}  -radix hex {40 0ns}
add_force {/dequantization/relu}    -radix hex {1 0ns}

# Hold READY low for a while
add_force {/dequantization/M_AXIS_TREADY} -radix hex {0 0ns}

# Send one sample while READY=0
add_force {/dequantization/S_AXIS_TDATA}  -radix hex {00000100 0ns} ;# +256
add_force {/dequantization/S_AXIS_TID}    -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {1 0ns}
add_force {/dequantization/S_AXIS_TVALID} -radix hex {1 0ns}
run 40ns

# Now let downstream accept data
add_force {/dequantization/M_AXIS_TREADY} -radix hex {1 0ns}
run 40ns

add_force {/dequantization/S_AXIS_TVALID} -radix hex {0 0ns}
add_force {/dequantization/S_AXIS_TLAST}  -radix hex {0 0ns}
run 100ns

# End of simulation window
run 200ns