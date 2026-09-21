`timescale 1ns / 1ps

module Down_Counter1(
        input wire clk,rst,
        output reg [6:0]qdc1,qdc2,qdc3,qdc4,qdc5,qdc10
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
        if(rst) qdc1 <= lmt;
        else if (qdc1 == zero ) qdc1 <= lmt;
        else qdc1 <= qdc1 - cntr1;
    end
    
    always @(posedge clk) begin
        if(rst) qdc2 <= lmt;
        else if (qdc2 == zero ) qdc2 <= lmt;
        else qdc2 <= qdc2 - cntr2;
    end
    
    always @(posedge clk) begin
        if(rst) begin
        qdc3 <= lmt;
        end
        else if ( (qdc3 > lmt) ) begin
        qdc3 <= lmt;
        end
        else qdc3 <= qdc3 - cntr3;
    end
    
    always @(posedge clk) begin
        if(rst) qdc4 <= lmt;
        else if (qdc4 == zero ) qdc4 <= lmt;
        else qdc4 <= qdc4 - cntr4;
    end
    
    always @(posedge clk) begin
        if(rst) qdc5 <= lmt;
        else if (qdc5 == zero ) qdc5 <= lmt;
        else qdc5 <= qdc5 - cntr5;
    end
    
    always @(posedge clk) begin
        if(rst) qdc10 <= lmt;
        else if (qdc10 == zero ) qdc10 <= lmt;
        else qdc10 <= qdc10 - cntr10;
    end
    
endmodule
