relaunch_sim

# Clock and reset
add_force {/index_gen/clk} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/index_gen/rst} -radix hex {1 0ns}
run 30ns
add_force {/index_gen/rst} -radix hex {0 0ns}

# Set dimensions and diffs to match accelerator testbench example
add_force {/index_gen/filter_w} -radix unsigned {3 0ns}
add_force {/index_gen/filter_h} -radix unsigned {2 0ns}
add_force {/index_gen/filter_c} -radix unsigned {2 0ns}
add_force {/index_gen/output_w} -radix unsigned {2 0ns}
add_force {/index_gen/output_h} -radix unsigned {2 0ns}
add_force {/index_gen/input_end_diff_fw} -radix dec {2 0ns}
add_force {/index_gen/input_end_diff_fh} -radix dec {6 0ns}
add_force {/index_gen/input_end_diff_fc} -radix dec {-17 0ns}
add_force {/index_gen/input_end_diff_ow} -radix dec {-15 0ns}

# No back pressure initially
add_force {/index_gen/M_AXIS_TREADY} -radix hex {1 0ns}

# 1. Basic Single Operation
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 10ns
# Expected: {/index_gen/M_AXIS_TVALID} == 1 (TVALID not asserted on first cycle)
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000000 (First input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000000 (First filter addr wrong)
# Expected: {/index_gen/M_AXIS_TLAST} == 0 (TLAST asserted too early)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000001 (Second input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000001 (Second filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000002 (Third input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000002 (Third filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000004 (Fourth input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000003 (Fourth filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000005 (Fifth input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000004 (Fifth filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000006 (Sixth input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000005 (Sixth filter addr wrong)
run 400ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000015 (Near-last input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x00000009 (Near-last filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000016 (Second-last input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x0000000A (Second-last filter addr wrong)
run 10ns
# Expected: {/index_gen/M_AXIS_TDATA_input_addr} == 0x00000017 (Last input addr wrong)
# Expected: {/index_gen/M_AXIS_TDATA_filter_addr} == 0x0000000B (Last filter addr wrong)
# Expected: {/index_gen/M_AXIS_TLAST} == 1 (TLAST not asserted on last cycle)
run 20ns
# Expected: {/index_gen/M_AXIS_TVALID} == 0 (TVALID not deasserted after completion)

# 2. Basic Double Operation
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
# Expected: same sequence twice, resetting to 0x0 each time

# 3. Basic Single Operation back-to-back
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
# Expected: two sequences, each starting from 0x0

# 4. Initial Load Single Operation
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
# Expected: same sequence

# 5. Basic Multi Operation
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 150ns
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 150ns
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 480ns
# Expected: each start resets to 0x0

# Apply Back Pressure
add_force {/index_gen/M_AXIS_TREADY} -radix hex {0 0ns}
run 10ns

# 6. Basic Single Operation with backpressure
add_force {/index_gen/conv_idle} -radix hex {1 0ns}
run 10ns
add_force {/index_gen/conv_idle} -radix hex {0 0ns}
run 100ns

# Alleviate Back Pressure
add_force {/index_gen/M_AXIS_TREADY} -radix hex {1 0ns}
run 480ns
# Expected: stalls during backpressure (addr/tvalid hold), then resumes sequence to completion