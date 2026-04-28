relaunch_sim

# Clock and reset
add_force {/staged_mac/clk} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/staged_mac/rst} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/rst} -radix hex {1 0ns}
# No back pressure
add_force {/staged_mac/M_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0101 0ns}
add_force {/staged_mac/bias} -radix hex {00000005 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0006

# 2. Basic Double Operation
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0101 0ns}
add_force {/staged_mac/bias} -radix hex {000005C8 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0101 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_05CA


# 3. Basic Single Operation back-to-back
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0203 0ns}
add_force {/staged_mac/bias} -radix hex {00000001 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0202 0ns}
add_force {/staged_mac/bias} -radix hex {00000050 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0007
#   0x0000_0054


# 4. Inital Load Single Operation ********
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0001 0ns}
add_force {/staged_mac/bias} -radix hex {00000001 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0303 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_000A *****


# 5. Basic Multi Operation
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0101 0ns}
add_force {/staged_mac/bias} -radix hex {00000004 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0102 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0203 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0101 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0102 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0203 0ns}
run 10ns

add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50 ns
# Expected:
#   0x0000_000D
#   0x0000_000D


# Apply Back Pressure
add_force {/staged_mac/M_AXIS_TREADY} -radix hex {1 0ns}
run 10ns

# 6. Basic Single Operation
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
add_force {/staged_mac/bias} -radix hex {00000001 0ns}
run 10ns

add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
run 10ns

add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
run 10ns

# Expected:
#   0x0000_0021

add_force {/staged_mac/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
add_force {/staged_mac/bias} -radix hex {00000006 0ns}
run 10ns

add_force {/staged_mac/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
run 10ns

add_force {/staged_mac/S_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/S_AXIS_TDATA} -radix hex {0204 0ns}
run 10ns
add_force {/staged_mac/S_AXIS_TVALID} -radix hex {0 0ns}
run 50ns

# Expected:
#   0x0000_001E
