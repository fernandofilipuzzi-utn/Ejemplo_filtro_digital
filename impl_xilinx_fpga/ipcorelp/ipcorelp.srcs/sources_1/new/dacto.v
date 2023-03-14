module dacto#(
    parameter Q=32,	//parte fraccionaria
    parameter N=64,
    parameter N_out=12) //tamaño total de la palabra
(
    input clk,
    input [(N-1):0] x,
    output reg [(N_out-1):0] y
    );
    
    reg [N-1:0] yout;
    
    always @(posedge clk)
    begin
        yout<=(x[N-1:0] >> (Q-1) - (N_out-1) ) + 64'h800; 
        y<=yout[11:0];              
    end
    
endmodule