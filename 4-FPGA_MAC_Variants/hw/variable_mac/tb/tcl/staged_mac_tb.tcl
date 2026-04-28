relaunch_sim

# Clock and reset
add_force {/staged_mac/ACLK} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/staged_mac/ARESETN} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/ARESETN} -radix hex {1 0ns}
# No back pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00101 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0001

# 2. Basic Double Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {2 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00101 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00101 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0002


# 3. Basic Single Operation back-to-back
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {3 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00203 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {4 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00202 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0006
#   0x0000_0004


# 4. Inital Load Single Operation ********
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {5 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00001 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {1 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TID} -radix hex {6 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00303 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_000A *****


# 5. Basic Multi Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {7 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00101 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {8 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00102 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {9 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00203 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50 ns
# Expected:
#   0x0000_0009


# Apply Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}
run 10ns

# 6. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {A 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00204 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
# Aleaviate Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0008

#######################################################################

# Clock and reset
add_force {/staged_mac/ACLK} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/staged_mac/ARESETN} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/ARESETN} -radix hex {1 0ns}
# No back pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20011 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0001

# 2. Basic Double Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {2 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {00101 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20011 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0002


# 3. Basic Single Operation back-to-back
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {3 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20023 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {4 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20022 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0006
#   0x0000_0004


# 4. Inital Load Single Operation ********
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {5 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20001 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {1 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TID} -radix hex {6 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20033 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_000A *****


# 5. Basic Multi Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {7 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20011 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {8 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20012 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {9 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20023 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50 ns
# Expected:
#   0x0000_0009


# Apply Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}
run 10ns

# 6. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {A 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {20024 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
# Aleaviate Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0008

#############################################################################

# Clock and reset
add_force {/staged_mac/ACLK} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/staged_mac/ARESETN} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/ARESETN} -radix hex {1 0ns}
# No back pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}


# 1. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10005 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0001

# 2. Basic Double Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {2 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10005 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10005 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0002


# 3. Basic Single Operation back-to-back
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {3 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {1000A 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {4 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {1000B 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_0004
#   0x0000_0002


# 4. Inital Load Single Operation ********
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {5 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10006 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {1 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TID} -radix hex {6 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {1000A 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50ns
# Expected:
#   0x0000_000A *****


# 5. Basic Multi Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {0 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {7 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10005 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {8 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {1000B 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {9 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10009 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 50 ns
# Expected:
#   0x0000_0001


# Apply Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {1 0ns}
run 10ns

# 6. Basic Single Operation
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TLAST} -radix hex {1 0ns}
add_force {/staged_mac/SD_AXIS_TID} -radix hex {A 0ns}
add_force {/staged_mac/SD_AXIS_TDATA} -radix hex {10007 0ns}
add_force {/staged_mac/SD_AXIS_TUSER} -radix hex {0 0ns}
run 10ns
add_force {/staged_mac/SD_AXIS_TVALID} -radix hex {0 0ns}
run 30ns
# Aleaviate Back Pressure
add_force {/staged_mac/MO_AXIS_TREADY} -radix hex {0 0ns}
run 50ns
# Expected:
#   0xFFFF_FFFF

