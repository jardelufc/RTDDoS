proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xcku5p-ffvb676-2-e
  set_property board_part xilinx.com:kcu116:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/pedro/Documents/arm7/tcc-arm7.cache/wt [current_project]
  set_property parent.project_path C:/Users/pedro/Documents/arm7/tcc-arm7.xpr [current_project]
  set_property ip_output_repo C:/Users/pedro/Documents/arm7/tcc-arm7.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet C:/Users/pedro/Documents/arm7/tcc-arm7.runs/synth_1/Datapath.dcp
  read_ip -quiet C:/Users/pedro/Documents/arm7/tcc-arm7.srcs/sources_1/ip/cordic_0/cordic_0.xci
  set_property is_locked true [get_files C:/Users/pedro/Documents/arm7/tcc-arm7.srcs/sources_1/ip/cordic_0/cordic_0.xci]
  read_ip -quiet C:/Users/pedro/Documents/arm7/tcc-arm7.srcs/sources_1/ip/div_gen_0/div_gen_0.xci
  set_property is_locked true [get_files C:/Users/pedro/Documents/arm7/tcc-arm7.srcs/sources_1/ip/div_gen_0/div_gen_0.xci]
  link_design -top Datapath -part xcku5p-ffvb676-2-e
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Datapath_opt.dcp
  catch { report_drc -file Datapath_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Datapath_placed.dcp
  catch { report_io -file Datapath_io_placed.rpt }
  catch { report_utilization -file Datapath_utilization_placed.rpt -pb Datapath_utilization_placed.pb }
  catch { report_control_sets -verbose -file Datapath_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Datapath_routed.dcp
  catch { report_drc -file Datapath_drc_routed.rpt -pb Datapath_drc_routed.pb -rpx Datapath_drc_routed.rpx }
  catch { report_methodology -file Datapath_methodology_drc_routed.rpt -rpx Datapath_methodology_drc_routed.rpx }
  catch { report_power -file Datapath_power_routed.rpt -pb Datapath_power_summary_routed.pb -rpx Datapath_power_routed.rpx }
  catch { report_route_status -file Datapath_route_status.rpt -pb Datapath_route_status.pb }
  catch { report_clock_utilization -file Datapath_clock_utilization_routed.rpt }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Datapath_timing_summary_routed.rpt -rpx Datapath_timing_summary_routed.rpx }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Datapath_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Datapath.mmi }
  write_bitstream -force Datapath.bit 
  catch {write_debug_probes -no_partial_ltxfile -quiet -force debug_nets}
  catch {file copy -force debug_nets.ltx Datapath.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

