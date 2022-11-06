//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Oct 24 12:47:25 2022
//Host        : embedded running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ck_io,
    ck_io12,
    sys_clock,
    vaux1_n,
    vaux1_p);
  output [11:0]ck_io;
  output ck_io12;
  input sys_clock;
  input vaux1_n;
  input vaux1_p;

  wire [11:0]ck_io;
  wire ck_io12;
  wire sys_clock;
  wire vaux1_n;
  wire vaux1_p;

  design_1 design_1_i
       (.ck_io(ck_io),
        .ck_io12(ck_io12),
        .sys_clock(sys_clock),
        .vaux1_n(vaux1_n),
        .vaux1_p(vaux1_p));
endmodule
