`timescale 1ns / 1ps

module ALL_TB(    );
    
    integer i,j,k,m,n,hata,hata_m,g,ab;
    reg     clk,rst,a,b,Cin;
    reg     rst_counter1;
    reg     rst_down_counter1;
    reg     [1:0] shft;
    reg     [3:0] sel;
    reg     [3:0] A,B;
    reg     [2:0] gates1;                                   
    wire    [6:0]shftq;
    wire    qg1,Cout; 
    wire    [6:0]qc1,qc2,qc3,qc4,qc5,qc10;
    wire    [6:0]qdc1,qdc2,qdc3,qdc4,qdc5,qdc10;
    wire    [3:0]Sum,z;
    reg     [1:0]x,y;
    
    Shift_Reg_4     dut0    (.clk(clk), .rst(rst), .shft(shft), .sel(sel), .shftq(shftq));
    Gates_1         dut1    (.clk(clk), .rst(rst), .gates1(gates1), .a(a), .b(b), .qg1(qg1));  
    Counter_1       dut2    (.clk(clk), .rst(rst_counter1), .qc1(qc1), .qc2(qc2), .qc3(qc3),
                             .qc4(qc4), .qc5(qc5), .qc10(qc10));
    Down_Counter1   dut3    (.clk(clk), .rst(rst_down_counter1), .qdc1(qdc1), .qdc2(qdc2), .qdc3(qdc3),
                             .qdc4(qdc4), .qdc5(qdc5), .qdc10(qdc10));
    adder4          dut4    (.Cin(Cin), .A(A), .B(B), .Cout(Cout), .Sum(Sum));
    mult2            dut5    (.x(x), .y(y), .z(z));
    initial begin
        clk = 1'b0;
        forever #2 clk = ~clk;
    end
    

    initial begin
        rst     = 1'b1;
        shft    = 2'b00;
        sel     = 4'b0000;
        a       = 1'b1;
        b       = 1'b0;
        gates1  = 3'b000;
        rst_counter1 = 1'b1 ;
        rst_down_counter1 = 1'b1;
        #20;
//20        
     @(negedge clk);
        rst     = 1'b0;
        rst_counter1 = 1'b0 ;
        rst_down_counter1 = 1'b0;
     repeat(3)  @(posedge clk);   
//45    
     @(negedge clk);
        shft    = 2'b10;
        sel     = 4'b0000;
//50        
     repeat(3)  @(posedge clk);
//75
     @(negedge clk);
        sel     = 4'b0001;
//80
     repeat(3)  @(posedge clk);
//105
     @(negedge clk);
        sel     = 4'd2;
        
       
//110
     repeat(3)  @(posedge clk);
//135
     @(negedge clk);
        sel     = 4'd3;
        
       
       
//140
     repeat(3)  @(posedge clk);
//165
     @(negedge clk);
        sel     = 4'd4;
        
      
      
//170
     repeat(3)  @(posedge clk);
//195
     @(negedge clk);
        shft    = 2'b01;
        sel     = 4'd0;
//200
     repeat(3)  @(posedge clk);
//225
     @(negedge clk);
        sel     = 4'd1;
//230
     repeat(3)  @(posedge clk);
//255
     @(negedge clk);
        sel     = 4'd2;
//260
     repeat(3)  @(posedge clk);
//285
     @(negedge clk);
        sel     = 4'd3;
//290
     repeat(3)  @(posedge clk);
//315
     @(negedge clk);
        sel     = 4'd4;
//320
     repeat(3)  @(posedge clk);
//345
     @(negedge clk);
        sel     = 4'd0; 
        rst     = 1'b1;
//350 --------------GATES--------------------------
     
     for (g=0 ; g<8 ; g=g+1) begin
        for (ab = 0; ab<4 ; ab= ab+1) begin
            @(negedge clk);
            gates1 = g;
            {a,b} = ab;
            @(posedge clk);
            @(negedge clk);
        end    
     end
        
    end
    
    initial begin 
        #100;
        hata = 0;
        for(k=0; k<2; k=k+1) begin      //Cin = 0 ve 1
            Cin = k[0];
            for (i=0; i<16 ; i=i+1) begin   // i ve j 16 şar değer alabilir. 0000,0001,0010,....,1111
                for (j=0; j<16 ;j=j+1) begin
                A = i;
                B = j;
                #10;
                    if ({Cout,Sum} !== A + B + Cin) begin
                    hata = hata +1;
                    end
                end
            end
        end
        $display("ADDER bitti. Toplam hata: %0d / 512", hata);
            $finish;
    end
    
    initial begin
        hata_m = 0;
            for(m=0 ; m<4 ; m=m+1) begin
                for(n=0 ; n<4 ; n=n+1) begin
                x=m;
                y=n;
                #10;
                 if (z !== x * y) begin
                    hata_m = hata_m + 1;
                    $display("MULT HATA: %0d x %0d -> z=%b (beklenen %0d)", x, y, z, x * y);
                    end
                end
            end  
            $display("MULT2 bitti. Toplam hata: %0d / 16", hata_m);  
     end
    
   initial begin
    $monitor("|Zaman:%t|rst:%b|shft:%b|sel:%b||SHFT:%b||a:%b|b:%b|Gates:%b||GatesReslt:%b||Counter+1:%d||Counter+2:%d||Counter+3:%d||Counter+4:%d||Counter+5:%d||Counter+10:%d||Down Counter+1:%d||Down Counter+2:%d||Down Counter+3:%d||Down Counter+4:%d||Down Counter+5:%d||Down Counter+10:%d||Sum:%b||Cout:%b||Cin:%b||Hata:%d||x:%b||y:%b||z:%b",
             $time, rst, shft, sel, shftq, a, b, gates1,qg1,qc1,qc2,qc3,qc4,qc5,qc10,qdc1,qdc2,qdc3,qdc4,qdc5,qdc10,Sum,Cout,Cin,hata,x,y,z);
   end
  
endmodule
