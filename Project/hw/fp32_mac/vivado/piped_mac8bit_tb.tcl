relaunch_sim

# Clock and reset
add_force {/piped_mac/ACLK} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/piped_mac/ARESETN} -radix hex {0 0ns}
run 30ns
add_force {/piped_mac/ARESETN} -radix hex {1 0ns}
# No back pressure
add_force {/piped_mac/MO_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation: 10 * 5 = 50
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3F000000 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns

add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3E800000 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 300ns

#2 Double Operation
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3F400000 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns

add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3F000000 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 300ns

add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3E000000  0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns

add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/piped_mac/SD_AXIS_TDATA} -radix hex {0x3E800000 0ns}
add_force {/piped_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/piped_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 300ns

# Expected:
#   0x3ED00000


