`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2022 13:28:03
// Design Name: 
// Module Name: sum
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


module sum#(
    parameter N=64) //tamaño total de la palabra
(
    input [(N-1):0] A3,
    input [(N-1):0] A4,
    input [(N-1):0] A5,
    input [(N-1):0] A8,
    input [(N-1):0] A9,
    input [(N-1):0] A10,
    input [(N-1):0] A11,
    output reg [(N-1):0] B
    );
    always 
    begin
        B<=A3+A4+A5+A8+A9+A10+A11;               
    end
endmodule
