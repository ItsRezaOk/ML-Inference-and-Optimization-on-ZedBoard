onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib staged_mac_bd_opt

do {wave.do}

view wave
view structure
view signals

do {staged_mac_bd.udo}

run -all

quit -force
