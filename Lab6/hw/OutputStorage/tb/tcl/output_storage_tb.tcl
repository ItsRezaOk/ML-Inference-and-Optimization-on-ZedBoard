relaunch_sim

# Clock and reset
add_force {/output_storage/clk} -radix hex {0 0ns} {1 5000ps} -repeat_every 10000ps
add_force {/output_storage/rst} -radix hex {1 0ns}
run 30ns
add_force {/output_storage/rst} -radix hex {0 0ns}

# 1. Output A1

add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/max_pooling} -radix hex {0 0ns}
add_force {/output_storage/elements_per_channel} -radix hex {10 0ns}
add_force {/output_storage/output_w} -radix hex {4 0ns}
add_force {/output_storage/output_h} -radix hex {4 0ns}
add_force {/output_storage/initial_offset} -radix hex {0 0ns}

add_force {/output_storage/conv_idle} -radix hex {0 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {0000000A1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 2. Output A2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 3. Output A3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {2 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 4. Output A4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {3 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 5. Output B1
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {00 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 6. Output B3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {02 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 7. Output B2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {01 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 8. Output B4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {03 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 9. Output C1

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 10. Output C2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 11. Output C3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {2 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 12. Output C4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {3 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 13. Output D1

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 14. Output D2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 15. Output D3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {2 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 16. Output D4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {3 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 17. Output E1

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 18. Output E2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 19. Output E3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {2 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 20. Output E4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {3 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

add_force {/output_storage/rst} -radix hex {1 0ns}
run 300ns
add_force {/output_storage/rst} -radix hex {0 0ns}

#############
#MAX POOLING#
#############


# 1. Output A1

add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/max_pooling} -radix hex {1 0ns}
add_force {/output_storage/elements_per_channel} -radix hex {2 0ns}
add_force {/output_storage/output_w} -radix hex {2 0ns}
add_force {/output_storage/output_h} -radix hex {4 0ns}
add_force {/output_storage/initial_offset} -radix hex {0 0ns}

add_force {/output_storage/conv_idle} -radix hex {0 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000071 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 2. Output A2
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 3. Output A3
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {2 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns

# 4. Output A4
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {3 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000A4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}


add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}
run 50ns


# 5. Output B1
add_force {/output_storage/BRAM_dout} -radix hex {0000007F 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {00 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 6. Output B2
add_force {/output_storage/BRAM_dout} -radix hex {00000010 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {01 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 7. Output B3
add_force {/output_storage/BRAM_dout} -radix hex {00000080 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {02 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 8. Output B4
add_force {/output_storage/BRAM_dout} -radix hex {0000007F 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {03 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000B4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns


# 9. Output C1
add_force {/output_storage/BRAM_dout} -radix hex {0000007F 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {00 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 10. Output C2
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {01 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 11. Output C3
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {02 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 12. Output C4
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {03 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000C4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 13. Output D1
add_force {/output_storage/BRAM_dout} -radix hex {00000080 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {00 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns


# 14. Output D2
add_force {/output_storage/BRAM_dout} -radix hex {00FF0000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {01 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns


# 15. Output D3
add_force {/output_storage/BRAM_dout} -radix hex {00000080 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {02 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns


# 16. Output D4
add_force {/output_storage/BRAM_dout} -radix hex {00FF0000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {03 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000D4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 17. Output E1
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {00 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E1 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 18. Output E2
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {01 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E2 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 18. Output E3
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {02 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E3 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns

# 18. Output E4
add_force {/output_storage/BRAM_dout} -radix hex {00000000 0ns}

add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}
add_force {/output_storage/S_AXIS_TLAST} -radix hex {0 0ns}
add_force {/output_storage/S_AXIS_TID} -radix hex {03 0ns}
add_force {/output_storage/S_AXIS_TDATA} -radix hex {000000E4 0ns}
run 10ns
add_force {/output_storage/S_AXIS_TVALID} -radix hex {1 0ns}

run 50ns
