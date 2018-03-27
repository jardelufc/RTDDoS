create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]
create_generated_clock -name {c1/cycle[0]} -source [get_ports clk] -divide_by 1 [get_pins {c1/FSM_sequential_cycle_reg[0]/Q}]
create_generated_clock -name {c1/cycle[1]} -source [get_ports clk] -divide_by 1 [get_pins {c1/FSM_sequential_cycle_reg[1]/Q}]
create_generated_clock -name {c1/cycle[2]} -source [get_ports clk] -divide_by 1 [get_pins {c1/FSM_sequential_cycle_reg[2]/Q}]
create_generated_clock -name {c1/cycle[3]} -source [get_ports clk] -divide_by 1 [get_pins {c1/FSM_sequential_cycle_reg[3]/Q}]
create_generated_clock -name {c1/cycle[4]} -source [get_ports clk] -divide_by 1 [get_pins {c1/FSM_sequential_cycle_reg[4]/Q}]

