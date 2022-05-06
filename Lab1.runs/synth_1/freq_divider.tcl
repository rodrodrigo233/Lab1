# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
set_msg_config  -id {Synth 8-614}  -string {{WARNING: [Synth 8-614] signal 'valor' is read in the process but is not in the sensitivity list [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote.vhd:13]}}  -suppress 
set_msg_config  -id {Synth 8-285}  -string {{ERROR: [Synth 8-285] failed synthesizing module 'Antirrebote_v2' [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote_v2.vhd:10]}}  -suppress 
set_msg_config  -id {Vivado_Tcl 4-5}  -string {{ERROR: [Vivado_Tcl 4-5] Elaboration failed - please see the console for details}}  -suppress 
set_msg_config  -id {Synth 8-3522}  -string {{ERROR: [Synth 8-3522] signal 'copia_input' is already used in the current clocking condition [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote_v2.vhd:22]}}  -suppress 
set_msg_config  -id {Synth 8-614}  -string {{WARNING: [Synth 8-614] signal 'copia_input' is read in the process but is not in the sensitivity list [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote_v2.vhd:14]}}  -suppress 
set_msg_config  -id {Synth 8-27}  -string {{ERROR: [Synth 8-27] else clause after check for clock not supported [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote_v2.vhd:31]}}  -suppress 
set_msg_config  -id {Synth 8-285}  -string {{ERROR: [Synth 8-285] failed synthesizing module 'Arrebote' [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Arrebote.vhd:10]}}  -suppress 
set_msg_config  -id {Synth 8-26}  -string {{ERROR: [Synth 8-26] attribute 'event not implemented [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Arrebote.vhd:29]}}  -suppress 
set_msg_config  -id {Synth 8-27}  -string {{ERROR: [Synth 8-27] else clause after check for clock not supported [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Arrebote.vhd:30]}}  -suppress 
set_msg_config  -id {Synth 8-26}  -string {{ERROR: [Synth 8-26] attribute 'event not implemented [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Arrebote.vhd:20]}}  -suppress 
set_msg_config  -id {Project 1-19}  -string {{CRITICAL WARNING: [Project 1-19] Could not find the file 'C:/Xilinx_clase/Lab1/Lab1.srcs/sim_1/new/tb_LFSR.vhd'.}}  -suppress 
set_msg_config  -id {Synth 8-327}  -string {{WARNING: [Synth 8-327] inferring latch for variable 'output_reg' [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote.vhd:19]}}  -suppress 
set_msg_config  -id {Synth 8-327}  -string {{WARNING: [Synth 8-327] inferring latch for variable 'valor_reg' [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote.vhd:22]}}  -suppress 
set_msg_config  -id {Synth 8-327}  -string {{WARNING: [Synth 8-327] inferring latch for variable 'c_reg' [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote.vhd:20]}}  -suppress 
set_msg_config  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design antirrebote has unconnected port clk}}  -suppress 
set_msg_config  -id {Synth 8-3332}  -string {{WARNING: [Synth 8-3332] Sequential element (valor_reg) is unused and will be removed from module antirrebote.}}  -suppress 
set_msg_config  -id {Synth 8-3332}  -string {{WARNING: [Synth 8-3332] Sequential element (c_reg[31]) is unused and will be removed from module antirrebote.}}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -string {{WARNING: [Constraints 18-5210] No constraints selected for write.
Resolution: This message can indicate that there are no constraints for the design, or it can indicate that the used_in flags are set such that the constraints are ignored. This later case is used when running synth_design to not write synthesis constraints to the resulting checkpoint. Instead, project constraints are read when the synthesized design is opened.}}  -suppress 
set_msg_config  -id {Synth 8-27}  -string {{ERROR: [Synth 8-27] else clause after check for clock not supported [C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Antirrebote_v2.vhd:27]}}  -suppress 
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Xilinx_clase/Lab1/Lab1.cache/wt [current_project]
set_property parent.project_path C:/Xilinx_clase/Lab1/Lab1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property ip_output_repo c:/Xilinx_clase/Lab1/Lab1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/LFSR.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/rst_async_sync.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Arrebote.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/FFD.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/Sincronizador.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/freq_divider.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/pwm.vhd
  C:/Xilinx_clase/Lab1/Lab1.srcs/sources_1/new/pwm_8.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/unsj/Quinto A�o/Digitales -FPGA/zedboard_master_XDC_RevC_D_v3.xdc}}
set_property used_in_implementation false [get_files {{C:/unsj/Quinto A�o/Digitales -FPGA/zedboard_master_XDC_RevC_D_v3.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top freq_divider -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef freq_divider.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file freq_divider_utilization_synth.rpt -pb freq_divider_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
