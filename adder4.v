`timescale 1ns / 1ps

module adder4(
    input wire Cin,
    input wire [3:0]A,B,
    output reg Cout,
    output reg [3:0]Sum
    );
    reg [3:0]AxorB,AandB;
    reg [4:0] c;
    integer i;
    always @(*) begin
        c[0] = Cin;
           for (i = 0 ; i<4 ; i= i+1) begin
            AxorB[i] = A[i]  ^ B[i] ;
            AandB[i]  = A[i]  & B[i] ;
            Sum[i]  = AxorB[i]  ^ c[i];
            c[i+1] = AandB[i]  | ( AxorB[i]  & c[i]);
            end
         Cout = c[4];
    end
endmodule
