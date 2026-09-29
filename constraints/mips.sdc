create_clock -name clock -period 10.0 [get_ports clock]

set_clock_uncertainty -setup 0.2 [get_clocks clock]
set_clock_uncertainty -hold 0.05 [get_clocks clock]

set_input_delay 1.0 -clock clock [get_ports {reset Inst[*] Dout[*]}]

set_output_delay 1.0 -clock clock [get_ports {PC[*] MemRead MemWrite Addr[*] Din[*]}]

set_input_transition 0.2 [get_ports {reset Inst[*] Dout[*]}]

set_load 0.1 [get_ports {PC[*] MemRead MemWrite Addr[*] Din[*]}]

set_max_fanout 16 [current_design]
