`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 16:05:10
// Design Name: 
// Module Name: shift_reg
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

module shift_reg#(  
    parameter N=64)(
    input clk,
    input inicio,
    input [(N-1):0] A,
    output reg [(N-1):0] B,
    output reg fin);
        
    initial
    begin
        fin=1'b1;
    end
    
    always @( negedge clk or negedge inicio )
    begin
        if(inicio)
        begin
            fin=1'b1;
        end
        else
        begin
             B<=A;
             fin=1'b0;
        end
    end
endmodule
