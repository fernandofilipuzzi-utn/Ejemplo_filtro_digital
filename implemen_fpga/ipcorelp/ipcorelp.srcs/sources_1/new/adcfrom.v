`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2022 11:18:10
// Design Name: 
// Module Name: adcfrom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module adcfrom#(
    parameter Q=32,	//parte fraccionaria
    parameter N=64, //tamaño total de la palabra
    parameter N_in=12) 
(
    input clk,
    input [(N_in-1):0] x,
    output reg [(N-1):0] y
    );
    
    reg [N-1:0] xin;
    
    always @(posedge clk)
    begin
        xin<= {52'h0, x}-64'h800;   
        y<= xin[(N-1):0] << ( (Q-1) - (N_in-1) ) ;         
    end
    
endmodule
