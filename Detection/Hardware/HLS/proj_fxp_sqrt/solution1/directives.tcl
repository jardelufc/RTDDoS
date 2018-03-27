############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -register "fxp_sqrt_top" in_val
set_directive_interface -mode ap_ctrl_hs -register "fxp_sqrt_top"
set_directive_inline -region "fxp_sqrt_top"
set_directive_pipeline -rewind "fxp_sqrt_top"
set_directive_latency -max 42 "fxpnahid"
set_directive_inline "fxpnahid"
set_directive_unroll "fxpnahid"
set_directive_dataflow "fxpnahid"
set_directive_pipeline -II 1 "fxpnahid"
