relaunch_sim

# Clock and reset
add_force {/piped_mac/ACLK} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/piped_mac/ARESETN} -radix hex {0 0ns}
run 30ns
add_force {/piped_mac/ARESETN} -radix hex {1 0ns}
# No back pressure
add_force {/piped_mac/MO_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation: -7 * -8 = 56
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {98 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0038


# 1. Basic Single Operation (Signed): -8 * 3 = -24
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {83 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0xFFFF_FFE8


# 1. Basic Single Operation (Signed): -8 * -8 = 64
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {88 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0010


# 2. Basic Double Operation: (2*3) + (5*6) = 36
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {2 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {23 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {56 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0024


# 3. Basic Single Operation back-to-back
# First: (5 * 7) = 35
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {3 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {57 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
# Second: (-8 * 4) = -32
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {4 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {84 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0023
#   0xFFFF_FFE0


# 4. Inital Load Single Operation: 127 + (4*3) = 127 + 12 = 139
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {5 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {7F 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {1 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TID} -radix hex {6 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {43 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_008B

# 5. Basic Multi Operation: (5*3) + (1*7) + (4*7) = 15 + 7 + 28 = 50
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {7 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {53 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {8 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {17 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {9 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {47 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50 ns
# Expected:
#   0x0000_0032


# Apply Back Pressure
add_force {/piped_mac/MO_AXIS_TREADY} -radix hex {0 0ns}
run 10ns

# 6. Basic Single Operation: 2 * 3 = 6
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {A 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {23 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
# Alleviate Back Pressure
add_force {/piped_mac/MO_AXIS_TREADY} -radix hex {1 0ns}
run 50ns
# Expected:
#   0x0000_0006
