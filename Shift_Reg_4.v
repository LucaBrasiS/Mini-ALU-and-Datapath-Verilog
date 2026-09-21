`timescale 1ns / 1ps

module Shift_Reg_4( 
            input wire clk,rst,
            input wire [1:0]shft,
            input wire [3:0]sel,
            output reg [6:0]shftq
       );
       
        localparam zero = 7'b0000000;
        localparam stay         = 4'd0;
        localparam shift_right1 = 4'd1;
        localparam shift_left1  = 4'd2;
        localparam shift_right2 = 4'd3;
        localparam shift_left2  = 4'd4;
        localparam shift_right3 = 4'd5;
        localparam shift_left3  = 4'd6;
        localparam shift_right4 = 4'd7;
        localparam shift_left4  = 4'd8;
        localparam zero1        = 1'b0;
        localparam zero2        = 2'b00;
        localparam zero3        = 3'b000;
        localparam zero4        = 4'b0000;
        localparam one1         = 1'b1;
        localparam one2         = 2'b11;
        localparam one3         = 3'b111;
        localparam one4         = 4'b1111;
        
    always @(posedge clk) begin
        if (rst) shftq <= zero;
        else begin
          if (shft == 2'b10) begin
                case (sel)
                stay :
                        shftq <= shftq;
                shift_right1    :
                        shftq <= {one1,{shftq[6:1]}};
                shift_left1     :
                        shftq <= {{shftq[5:0]},one1};
                shift_right2    :
                        shftq <= {one2,{shftq[6:2]}};
                shift_left2     :
                        shftq <= {{shftq[4:0]},one2};
                shift_right3    :
                        shftq <= {one3,{shftq[6:3]}};
                shift_left3     :
                        shftq <= {{shftq[3:0]},one3};
                shift_right4    :      
                        shftq <= {one4,{shftq[6:4]}};
                shift_left4     :
                        shftq<=  {{shftq[2:0]},one4};
                default shftq <= shftq;  
            endcase
         end
            else if (shft == 2'b01)begin 
              case (sel)
                stay :
                        shftq <= shftq;
                shift_right1    :            
                        shftq <= {zero1,{shftq[6:1]}};
                shift_left1     :            
                        shftq <= {{shftq[5:0]},zero1};
                shift_right2    :            
                        shftq <= {zero2,{shftq[6:2]}};
                shift_left2     :            
                        shftq <= {{shftq[4:0]},zero2};
                shift_right3    :            
                        shftq <= {zero3,{shftq[6:3]}};
                shift_left3     :            
                        shftq <= {{shftq[3:0]},zero3};
                shift_right4    :            
                        shftq <= {zero4,{shftq[6:4]}};
                shift_left4     :            
                        shftq<=  {{shftq[2:0]},zero4};  
                default shftq <= shftq;
              endcase
           
            end
            
            else shftq <= shftq;
        end
    end

endmodule
