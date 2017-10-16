@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim mul_tb_behav -key {Behavioral:sim_1:Functional:mul_tb} -tclbatch mul_tb.tcl -view C:/Users/pedro/Documents/arm7/opencore.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
