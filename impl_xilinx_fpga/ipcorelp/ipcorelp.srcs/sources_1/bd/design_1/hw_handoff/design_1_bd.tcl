
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# adcfrom, dacto, sum, shift_reg, shift_reg, shift_reg, shift_reg, shift_reg, shift_reg, shift_reg

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
   set_property BOARD_PART digilentinc.com:arty-z7-20:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ck_io [ create_bd_port -dir O -from 11 -to 0 -type data ck_io ]
  set ck_io12 [ create_bd_port -dir O -type data ck_io12 ]
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   CONFIG.PHASE {0.000} \
 ] $sys_clock
  set vaux1_n [ create_bd_port -dir I -type data vaux1_n ]
  set vaux1_p [ create_bd_port -dir I -type data vaux1_p ]

  # Create instance: a_1, and set properties
  set a_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 a_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x00000002785B8840} \
   CONFIG.CONST_WIDTH {64} \
 ] $a_1

  # Create instance: a_2, and set properties
  set a_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 a_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0xFFFFFFFDEDA83EAA} \
   CONFIG.CONST_WIDTH {64} \
 ] $a_2

  # Create instance: a_3, and set properties
  set a_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 a_3 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x00000000963DFB80} \
   CONFIG.CONST_WIDTH {64} \
 ] $a_3

  # Create instance: adcfrom_0, and set properties
  set block_name adcfrom
  set block_cell_name adcfrom_0
  if { [catch {set adcfrom_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adcfrom_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: b_0, and set properties
  set b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 b_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x000000000077C7B3} \
   CONFIG.CONST_WIDTH {64} \
 ] $b_0

  # Create instance: b_1, and set properties
  set b_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 b_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x0000000001675719} \
   CONFIG.CONST_WIDTH {64} \
 ] $b_1

  # Create instance: b_2, and set properties
  set b_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 b_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x0000000001675719} \
   CONFIG.CONST_WIDTH {64} \
 ] $b_2

  # Create instance: b_3, and set properties
  set b_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 b_3 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x000000000077C7B3} \
   CONFIG.CONST_WIDTH {64} \
 ] $b_3

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT2_JITTER {124.615} \
   CONFIG.CLKOUT2_PHASE_ERROR {96.948} \
   CONFIG.CLKOUT2_USED {false} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {1} \
   CONFIG.USE_BOARD_FLOW {true} \
   CONFIG.USE_LOCKED {false} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: dacto_0, and set properties
  set block_name dacto
  set block_cell_name dacto_0
  if { [catch {set dacto_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dacto_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_0

  # Create instance: mult_gen_1, and set properties
  set mult_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_1 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_1

  # Create instance: mult_gen_2, and set properties
  set mult_gen_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_2 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_2

  # Create instance: mult_gen_3, and set properties
  set mult_gen_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_3 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_3

  # Create instance: mult_gen_6, and set properties
  set mult_gen_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_6 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_6

  # Create instance: mult_gen_7, and set properties
  set mult_gen_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_7 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_7

  # Create instance: mult_gen_8, and set properties
  set mult_gen_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_8 ]
  set_property -dict [ list \
   CONFIG.ClockEnable {true} \
   CONFIG.MultType {Parallel_Multiplier} \
   CONFIG.OutputWidthHigh {95} \
   CONFIG.OutputWidthLow {32} \
   CONFIG.PipeStages {1} \
   CONFIG.PortAWidth {64} \
   CONFIG.PortBWidth {64} \
   CONFIG.SyncClear {false} \
   CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_8

  # Create instance: sum_0, and set properties
  set block_name sum
  set block_cell_name sum_0
  if { [catch {set sum_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sum_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xadc_wiz_0, and set properties
  set xadc_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0 ]
  set_property -dict [ list \
   CONFIG.ADC_OFFSET_AND_GAIN_CALIBRATION {false} \
   CONFIG.ENABLE_CALIBRATION_AVERAGING {false} \
   CONFIG.ENABLE_RESET {false} \
   CONFIG.ENABLE_VCCDDRO_ALARM {false} \
   CONFIG.ENABLE_VCCPAUX_ALARM {false} \
   CONFIG.ENABLE_VCCPINT_ALARM {false} \
   CONFIG.INTERFACE_SELECTION {ENABLE_DRP} \
   CONFIG.OT_ALARM {false} \
   CONFIG.SENSOR_OFFSET_AND_GAIN_CALIBRATION {false} \
   CONFIG.SINGLE_CHANNEL_ENABLE_CALIBRATION {true} \
   CONFIG.SINGLE_CHANNEL_SELECTION {VAUXP1_VAUXN1} \
   CONFIG.USER_TEMP_ALARM {false} \
   CONFIG.VCCAUX_ALARM {false} \
   CONFIG.VCCINT_ALARM {false} \
 ] $xadc_wiz_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x11} \
   CONFIG.CONST_WIDTH {7} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {15} \
   CONFIG.DIN_TO {4} \
   CONFIG.DIN_WIDTH {16} \
   CONFIG.DOUT_WIDTH {11} \
 ] $xlslice_0

  # Create instance: za_1, and set properties
  set block_name shift_reg
  set block_cell_name za_1
  if { [catch {set za_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $za_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: za_2, and set properties
  set block_name shift_reg
  set block_cell_name za_2
  if { [catch {set za_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $za_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: za_3, and set properties
  set block_name shift_reg
  set block_cell_name za_3
  if { [catch {set za_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $za_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: zb0, and set properties
  set block_name shift_reg
  set block_cell_name zb0
  if { [catch {set zb0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $zb0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: zb_1, and set properties
  set block_name shift_reg
  set block_cell_name zb_1
  if { [catch {set zb_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $zb_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: zb_2, and set properties
  set block_name shift_reg
  set block_cell_name zb_2
  if { [catch {set zb_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $zb_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: zb_3, and set properties
  set block_name shift_reg
  set block_cell_name zb_3
  if { [catch {set zb_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $zb_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net adcfrom_0_y [get_bd_pins adcfrom_0/y] [get_bd_pins zb0/A]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins adcfrom_0/clk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins dacto_0/clk] [get_bd_pins mult_gen_0/CLK] [get_bd_pins mult_gen_1/CLK] [get_bd_pins mult_gen_2/CLK] [get_bd_pins mult_gen_3/CLK] [get_bd_pins mult_gen_6/CLK] [get_bd_pins mult_gen_7/CLK] [get_bd_pins mult_gen_8/CLK] [get_bd_pins xadc_wiz_0/dclk_in] [get_bd_pins za_1/clk] [get_bd_pins za_2/clk] [get_bd_pins za_3/clk] [get_bd_pins zb0/clk] [get_bd_pins zb_1/clk] [get_bd_pins zb_2/clk] [get_bd_pins zb_3/clk]
  connect_bd_net -net dacto_0_y [get_bd_ports ck_io] [get_bd_pins dacto_0/y]
  connect_bd_net -net mult_gen_0_P1 [get_bd_pins mult_gen_0/P] [get_bd_pins sum_0/A11]
  connect_bd_net -net mult_gen_1_P [get_bd_pins mult_gen_1/P] [get_bd_pins sum_0/A10]
  connect_bd_net -net mult_gen_2_P [get_bd_pins mult_gen_2/P] [get_bd_pins sum_0/A9]
  connect_bd_net -net mult_gen_3_P [get_bd_pins mult_gen_3/P] [get_bd_pins sum_0/A8]
  connect_bd_net -net mult_gen_6_P [get_bd_pins mult_gen_6/P] [get_bd_pins sum_0/A5]
  connect_bd_net -net mult_gen_7_P [get_bd_pins mult_gen_7/P] [get_bd_pins sum_0/A4]
  connect_bd_net -net mult_gen_8_P [get_bd_pins mult_gen_8/P] [get_bd_pins sum_0/A3]
  connect_bd_net -net shift_reg_0_out [get_bd_pins mult_gen_1/A] [get_bd_pins zb_1/B] [get_bd_pins zb_2/A]
  connect_bd_net -net shift_reg_1_B [get_bd_pins mult_gen_2/A] [get_bd_pins zb_2/B] [get_bd_pins zb_3/A]
  connect_bd_net -net shift_reg_2_B [get_bd_pins mult_gen_3/A] [get_bd_pins zb_3/B]
  connect_bd_net -net shift_reg_5_B [get_bd_pins mult_gen_6/A] [get_bd_pins za_1/B] [get_bd_pins za_2/A]
  connect_bd_net -net shift_reg_6_B [get_bd_pins mult_gen_7/A] [get_bd_pins za_2/B] [get_bd_pins za_3/A]
  connect_bd_net -net shift_reg_7_B [get_bd_pins mult_gen_8/A] [get_bd_pins za_3/B]
  connect_bd_net -net sum_0_B [get_bd_pins dacto_0/x] [get_bd_pins sum_0/B] [get_bd_pins za_1/A]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net vaux1_n_1 [get_bd_ports vaux1_n] [get_bd_pins xadc_wiz_0/vauxn1]
  connect_bd_net -net vaux1_p_1 [get_bd_ports vaux1_p] [get_bd_pins xadc_wiz_0/vauxp1]
  connect_bd_net -net xadc_wiz_0_do_out [get_bd_pins xadc_wiz_0/do_out] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net xadc_wiz_0_eoc_out [get_bd_ports ck_io12] [get_bd_pins xadc_wiz_0/den_in] [get_bd_pins xadc_wiz_0/eoc_out] [get_bd_pins za_1/inicio] [get_bd_pins za_2/inicio] [get_bd_pins za_3/inicio] [get_bd_pins zb0/inicio] [get_bd_pins zb_1/inicio] [get_bd_pins zb_2/inicio] [get_bd_pins zb_3/inicio]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xadc_wiz_0/daddr_in] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_10_dout [get_bd_pins a_2/dout] [get_bd_pins mult_gen_7/B]
  connect_bd_net -net xlconstant_11_dout [get_bd_pins a_3/dout] [get_bd_pins mult_gen_8/B]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xadc_wiz_0/di_in] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xadc_wiz_0/dwe_in] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins b_0/dout] [get_bd_pins mult_gen_0/B]
  connect_bd_net -net xlconstant_4_dout [get_bd_pins b_1/dout] [get_bd_pins mult_gen_1/B]
  connect_bd_net -net xlconstant_5_dout [get_bd_pins b_2/dout] [get_bd_pins mult_gen_2/B]
  connect_bd_net -net xlconstant_6_dout [get_bd_pins b_3/dout] [get_bd_pins mult_gen_3/B]
  connect_bd_net -net xlconstant_9_dout [get_bd_pins a_1/dout] [get_bd_pins mult_gen_6/B]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins adcfrom_0/x] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net za_1_fin [get_bd_pins mult_gen_6/CE] [get_bd_pins za_1/fin]
  connect_bd_net -net za_2_fin [get_bd_pins mult_gen_7/CE] [get_bd_pins za_2/fin]
  connect_bd_net -net za_3_fin [get_bd_pins mult_gen_8/CE] [get_bd_pins za_3/fin]
  connect_bd_net -net zb0_fin [get_bd_pins mult_gen_0/CE] [get_bd_pins zb0/fin]
  connect_bd_net -net zb_1_fin [get_bd_pins mult_gen_1/CE] [get_bd_pins zb_1/fin]
  connect_bd_net -net zb_2_fin [get_bd_pins mult_gen_2/CE] [get_bd_pins zb_2/fin]
  connect_bd_net -net zb_3_fin [get_bd_pins mult_gen_3/CE] [get_bd_pins zb_3/fin]
  connect_bd_net -net zb_4_B [get_bd_pins mult_gen_0/A] [get_bd_pins zb0/B] [get_bd_pins zb_1/A]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


