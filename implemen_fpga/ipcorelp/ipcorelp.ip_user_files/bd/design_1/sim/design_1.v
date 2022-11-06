//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Oct 24 11:52:05 2022
//Host        : embedded running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=30,numReposBlks=30,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=10,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (ck_io,
    ck_io12,
    sys_clock,
    vaux1_n,
    vaux1_p);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.CK_IO DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.CK_IO, LAYERED_METADATA undef" *) output [11:0]ck_io;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.CK_IO12 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.CK_IO12, LAYERED_METADATA undef" *) output ck_io12;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000" *) input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VAUX1_N DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VAUX1_N, LAYERED_METADATA undef" *) input vaux1_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VAUX1_P DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VAUX1_P, LAYERED_METADATA undef" *) input vaux1_p;

  wire [63:0]adcfrom_0_y;
  wire clk_wiz_0_clk_out1;
  wire [11:0]dacto_0_y;
  wire [63:0]mult_gen_0_P1;
  wire [63:0]mult_gen_1_P;
  wire [63:0]mult_gen_2_P;
  wire [63:0]mult_gen_3_P;
  wire [63:0]mult_gen_6_P;
  wire [63:0]mult_gen_7_P;
  wire [63:0]mult_gen_8_P;
  wire [63:0]shift_reg_0_out;
  wire [63:0]shift_reg_1_B;
  wire [63:0]shift_reg_2_B;
  wire [63:0]shift_reg_5_B;
  wire [63:0]shift_reg_6_B;
  wire [63:0]shift_reg_7_B;
  wire [63:0]sum_0_B;
  wire sys_clock_1;
  wire vaux1_n_1;
  wire vaux1_p_1;
  wire [15:0]xadc_wiz_0_do_out;
  wire xadc_wiz_0_eoc_out;
  wire [6:0]xlconstant_0_dout;
  wire [63:0]xlconstant_10_dout;
  wire [63:0]xlconstant_11_dout;
  wire [15:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;
  wire [63:0]xlconstant_3_dout;
  wire [63:0]xlconstant_4_dout;
  wire [63:0]xlconstant_5_dout;
  wire [63:0]xlconstant_6_dout;
  wire [63:0]xlconstant_9_dout;
  wire [11:0]xlslice_0_Dout;
  wire za_1_fin;
  wire za_2_fin;
  wire za_3_fin;
  wire zb0_fin;
  wire zb_1_fin;
  wire zb_2_fin;
  wire zb_3_fin;
  wire [63:0]zb_4_B;

  assign ck_io[11:0] = dacto_0_y;
  assign ck_io12 = xadc_wiz_0_eoc_out;
  assign sys_clock_1 = sys_clock;
  assign vaux1_n_1 = vaux1_n;
  assign vaux1_p_1 = vaux1_p;
  design_1_xlconstant_3_2 a_1
       (.dout(xlconstant_9_dout));
  design_1_xlconstant_9_0 a_2
       (.dout(xlconstant_10_dout));
  design_1_xlconstant_10_0 a_3
       (.dout(xlconstant_11_dout));
  design_1_adcfrom_0_0 adcfrom_0
       (.clk(clk_wiz_0_clk_out1),
        .x(xlslice_0_Dout),
        .y(adcfrom_0_y));
  design_1_xlconstant_3_0 b_0
       (.dout(xlconstant_3_dout));
  design_1_xlconstant_3_1 b_1
       (.dout(xlconstant_4_dout));
  design_1_xlconstant_4_0 b_2
       (.dout(xlconstant_5_dout));
  design_1_xlconstant_5_0 b_3
       (.dout(xlconstant_6_dout));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock_1),
        .clk_out1(clk_wiz_0_clk_out1));
  design_1_dacto_0_0 dacto_0
       (.clk(clk_wiz_0_clk_out1),
        .x(sum_0_B),
        .y(dacto_0_y));
  design_1_mult_gen_0_0 mult_gen_0
       (.A(zb_4_B),
        .B(xlconstant_3_dout),
        .CE(zb0_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_0_P1));
  design_1_mult_gen_0_2 mult_gen_1
       (.A(shift_reg_0_out),
        .B(xlconstant_4_dout),
        .CE(zb_1_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_1_P));
  design_1_mult_gen_1_0 mult_gen_2
       (.A(shift_reg_1_B),
        .B(xlconstant_5_dout),
        .CE(zb_2_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_2_P));
  design_1_mult_gen_2_0 mult_gen_3
       (.A(shift_reg_2_B),
        .B(xlconstant_6_dout),
        .CE(zb_3_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_3_P));
  design_1_mult_gen_0_3 mult_gen_6
       (.A(shift_reg_5_B),
        .B(xlconstant_9_dout),
        .CE(za_1_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_6_P));
  design_1_mult_gen_1_1 mult_gen_7
       (.A(shift_reg_6_B),
        .B(xlconstant_10_dout),
        .CE(za_2_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_7_P));
  design_1_mult_gen_2_1 mult_gen_8
       (.A(shift_reg_7_B),
        .B(xlconstant_11_dout),
        .CE(za_3_fin),
        .CLK(clk_wiz_0_clk_out1),
        .P(mult_gen_8_P));
  design_1_sum_0_0 sum_0
       (.A10(mult_gen_1_P),
        .A11(mult_gen_0_P1),
        .A3(mult_gen_8_P),
        .A4(mult_gen_7_P),
        .A5(mult_gen_6_P),
        .A8(mult_gen_3_P),
        .A9(mult_gen_2_P),
        .B(sum_0_B));
  design_1_xadc_wiz_0_0 xadc_wiz_0
       (.daddr_in(xlconstant_0_dout),
        .dclk_in(clk_wiz_0_clk_out1),
        .den_in(xadc_wiz_0_eoc_out),
        .di_in(xlconstant_1_dout),
        .do_out(xadc_wiz_0_do_out),
        .dwe_in(xlconstant_2_dout),
        .eoc_out(xadc_wiz_0_eoc_out),
        .vauxn1(vaux1_n_1),
        .vauxp1(vaux1_p_1),
        .vn_in(1'b0),
        .vp_in(1'b0));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlconstant_0_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_1_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  design_1_xlslice_0_0 xlslice_0
       (.Din(xadc_wiz_0_do_out),
        .Dout(xlslice_0_Dout));
  design_1_shift_reg_4_0 za_1
       (.A(sum_0_B),
        .B(shift_reg_5_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(za_1_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_shift_reg_1_0 za_2
       (.A(shift_reg_5_B),
        .B(shift_reg_6_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(za_2_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_shift_reg_2_1 za_3
       (.A(shift_reg_6_B),
        .B(shift_reg_7_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(za_3_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_zb_1_0 zb0
       (.A(adcfrom_0_y),
        .B(zb_4_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(zb0_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_shift_reg_0_0 zb_1
       (.A(zb_4_B),
        .B(shift_reg_0_out),
        .clk(clk_wiz_0_clk_out1),
        .fin(zb_1_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_shift_reg_0_1 zb_2
       (.A(shift_reg_0_out),
        .B(shift_reg_1_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(zb_2_fin),
        .inicio(xadc_wiz_0_eoc_out));
  design_1_shift_reg_0_2 zb_3
       (.A(shift_reg_1_B),
        .B(shift_reg_2_B),
        .clk(clk_wiz_0_clk_out1),
        .fin(zb_3_fin),
        .inicio(xadc_wiz_0_eoc_out));
endmodule
