`timescale 1ns / 1ps

module mult2(
        input wire [1:0]x,y,
        output reg [3:0]z
    );
    
    wire z0 =   x[0] & y[0];
    wire z1 =   (x[0] & y[1]) ^ (x[1] & y[0]);
    wire z2 =   ((x[0] & y[1]) & (x[1] & y[0])) ^ (x[1] & y[1]);
    wire z3 =   ((x[0] & y[1]) & (x[1] & y[0])) & (x[1] & y[1]);
    
    always @(*) begin
        z[0] = z0;
        z[1] = z1;
        z[2] = z2;
        z[3] = z3;
    end
endmodule
