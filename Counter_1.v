`timescale 1ns / 1ps

module Counter_1(
        input wire clk,rst,
        output reg [6:0]qc1,qc2,qc3,qc4,qc5,qc10
    );
 
    
    localparam cntr1    = 1'b1;
    localparam cntr2    = 2'd2;
    localparam cntr3    = 2'd3;
    localparam cntr4    = 3'd4;
    localparam cntr5    = 3'd5;
    localparam cntr10   = 4'd10;
    localparam lmt      = 7'b1100100;    
    localparam zero     = 7'b0000000; 
    
    always @(posedge clk) begin
        if(rst) qc1 <= zero;
        else if (qc1 == lmt ) qc1 <= zero;
        else qc1 <= qc1 + cntr1;
    end
    
    always @(posedge clk) begin
        if(rst) qc2 <= zero;
        else if (qc2 >= lmt ) qc2 <= zero;
        else qc2 <= qc2 + cntr2;
    end
    
    always @(posedge clk) begin
        if(rst) qc3 <= zero;
        else if (qc3 >= lmt ) qc3 <= zero;
        else qc3 <= qc3 + cntr3;
    end
    
    always @(posedge clk) begin
        if(rst) qc4 <= zero;
        else if (qc4 >= lmt ) qc4 <= zero;
        else qc4 <= qc4 + cntr4;
    end
    
    always @(posedge clk) begin
        if(rst) qc5 <= zero;
        else if (qc5 >= lmt ) qc5 <= zero;
        else qc5 <= qc5 + cntr5;
    end
    
    always @(posedge clk) begin
        if(rst) qc10 <= zero;
        else if (qc10 >= lmt ) qc10 <= zero;
        else qc10 <= qc10 + cntr10;
    end
    
endmodule
