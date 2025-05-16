`timescale 1ns / 1ps

module alu_tb;
    reg clk;  
    reg [3:0] sel;  
    reg signed [3:0] a, b;  
    wire signed [7:0] out;  

//making an instance of the Alu module
    Alu uut (
        .clk(clk),
        .sel(sel),
        .a(a),
        .b(b),
        .out(out)
    );

    // amking the clk toogles instead of begin static 
    initial begin
        clk = 0;
        forever #1 clk = ~clk;  // makes the clk toogles every 5ns
        
    end

    initial begin
        a = 4'b0101;  //a=5
        b = 4'b0011;  //b=2
        sel = 4'b0000;  // sel=0 (arithmetic operation, first one)
        
        // changing selctors for the same inputs every 10ns
        #10;  // Wait for 10ns
       sel=4'b0001;  // Test with sel = 1
        #10;  // Wait for 10ns
        sel=4'b0010;  // Test with sel = 2
        #10;  // Wait for 10ns
        sel=4'b0011;  // Test with sel = 3
        #10;  // Wait for 10ns
        sel=4'b0100;  // Test with sel = 4
        #10;  // Wait for 10ns
        sel=4'b0101;  // Test with sel = 5
        #10;  // Wait for 10ns
        sel=4'b0110;  // Test with sel = 6
        #10;  // Wait for 10ns
        sel=4'b0111;  // Test with sel = 7
        #10;  // Wait for 10ns
        sel=4'b1000;  // Test with sel = 8 (logical operation)
        #10;  // Wait for 10ns
        sel=4'b1001;
        #10;
        sel=4'b1010;
        #10;
         sel=4'b1011;
        #10;
         sel=4'b1100;
        #10;
         sel=4'b1101;
        #10;
         sel=4'b1110;
        #10;
         sel=4'b1111;
        #10;
        
        
        
                // changing a and b
        a=4'b1100;  // a=-4
        b=4'b1011;  // b=-5
        sel=4'b1010;  // and
        #10;  // Wait for 10ns
        sel=4'b1111;  // nor
        #10;  // 
        
        
        
        
        a=4'b1001;//-7
        b=4'b1010;//-6
        sel=4'b1010;//and
        #10;

        // end the simulation after some time
        #40;
        $finish;
    end
endmodule
