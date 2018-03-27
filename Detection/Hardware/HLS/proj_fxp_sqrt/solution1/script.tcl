############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj_fxp_sqrt
set_top fxpnahid
add_files fxp_sqrt_top.cpp
add_files -tb fxp_sqrt_test.cpp
open_solution "solution1"
set_part {xc7a100tcsg324-1}
create_clock -period 5 -name default
source "./proj_fxp_sqrt/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design
export_design -flow impl -rtl verilog -format syn_dcp
