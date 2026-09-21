`timescale 1ns / 1ps

module Gates_1(   
        
        input   wire    clk,rst,
        input   wire    [2:0]gates1,
        input   wire    a,b,
        output  reg     qg1
    );                              // a:1 | b:0
    
    localparam and1     = 3'b000;   //0
    localparam or1      = 3'b001;   //1
    localparam xor1     = 3'b010;   //1
    localparam nand1    = 3'b011;   //1
    localparam nor1     = 3'b100;   //0
    localparam xnor1    = 3'b101;   //0
    localparam na1      = 3'b110;   //0
    localparam nb1      = 3'b111;   //1
    
    always @(posedge clk) begin
        if (rst) qg1 <= 1'b0;
        else begin
            case (gates1) 
                and1    :   
                    qg1 <= a & b;
                or1     :
                    qg1 <= a | b;
                xor1    :
                    qg1 <= a ^ b;
                nand1   :
                    qg1 <= ~(a&b);
                nor1     :
                    qg1 <= ~(a|b);
                xnor1   :
                    qg1 <= ~(a^b);
                na1     :
                    qg1 <= ~(a);
                nb1     :
                    qg1 <= ~(b);
           endcase
        end    
    end     
                
endmodule
