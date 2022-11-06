vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xlconstant_v1_1_6
vlib activehdl/xlslice_v1_0_2
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_15

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xlconstant_v1_1_6 activehdl/xlconstant_v1_1_6
vmap xlslice_v1_0_2 activehdl/xlslice_v1_0_2
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_15 activehdl/mult_gen_v12_0_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xlconstant_v1_1_6  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_2_0/sim/design_1_xlconstant_2_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_0_1/sim/design_1_xlconstant_0_1.v" \
"../../../bd/design_1/ip/design_1_xadc_wiz_0_0/design_1_xadc_wiz_0_0.v" \

vlog -work xlslice_v1_0_2  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/f044/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_xlslice_0_0/sim/design_1_xlslice_0_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/1123/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_15 -93 \
"../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/d4d2/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_mult_gen_0_0/sim/design_1_mult_gen_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_xlconstant_3_0_1/sim/design_1_xlconstant_3_0.v" \
"../../../bd/design_1/ip/design_1_adcfrom_0_0/sim/design_1_adcfrom_0_0.v" \
"../../../bd/design_1/ip/design_1_dacto_0_0/sim/design_1_dacto_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_mult_gen_0_2/sim/design_1_mult_gen_0_2.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_xlconstant_3_1/sim/design_1_xlconstant_3_1.v" \
"../../../bd/design_1/ip/design_1_shift_reg_0_0/sim/design_1_shift_reg_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_mult_gen_1_0/sim/design_1_mult_gen_1_0.vhd" \
"../../../bd/design_1/ip/design_1_mult_gen_2_0/sim/design_1_mult_gen_2_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_shift_reg_0_1/sim/design_1_shift_reg_0_1.v" \
"../../../bd/design_1/ip/design_1_shift_reg_0_2/sim/design_1_shift_reg_0_2.v" \
"../../../bd/design_1/ip/design_1_xlconstant_4_0/sim/design_1_xlconstant_4_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_5_0/sim/design_1_xlconstant_5_0.v" \
"../../../bd/design_1/ip/design_1_sum_0_0/sim/design_1_sum_0_0.v" \
"../../../bd/design_1/ip/design_1_shift_reg_4_0/sim/design_1_shift_reg_4_0.v" \
"../../../bd/design_1/ip/design_1_shift_reg_1_0/sim/design_1_shift_reg_1_0.v" \
"../../../bd/design_1/ip/design_1_shift_reg_2_1/sim/design_1_shift_reg_2_1.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_mult_gen_0_3/sim/design_1_mult_gen_0_3.vhd" \
"../../../bd/design_1/ip/design_1_mult_gen_1_1/sim/design_1_mult_gen_1_1.vhd" \
"../../../bd/design_1/ip/design_1_mult_gen_2_1/sim/design_1_mult_gen_2_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ipcorelp.srcs/sources_1/bd/design_1/ipshared/c923" \
"../../../bd/design_1/ip/design_1_xlconstant_3_2/sim/design_1_xlconstant_3_2.v" \
"../../../bd/design_1/ip/design_1_xlconstant_9_0/sim/design_1_xlconstant_9_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_10_0/sim/design_1_xlconstant_10_0.v" \
"../../../bd/design_1/ip/design_1_zb_1_0/sim/design_1_zb_1_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

