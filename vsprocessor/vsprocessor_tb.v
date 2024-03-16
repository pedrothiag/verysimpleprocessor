`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:21 03/16/2024
// Design Name:   vsprocessor
// Module Name:   C:/Users/souza/Desktop/processador/vsprocessor/vsprocessor_tb.v
// Project Name:  vsprocessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vsprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vsprocessor_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] indata;

	// Outputs
	wire [7:0] outdata;
	wire [7:0] a_value;
	wire [7:0] pc_value;
	wire [12:0] ir_value;

	// Instantiate the Unit Under Test (UUT)
	vsprocessor uut (
		.clk(clk), 
		.rst(rst), 
		.indata(indata), 
		.outdata(outdata), 
		.a_value(a_value), 
		.pc_value(pc_value), 
		.ir_value(ir_value)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		indata = 0;
		
		#10;
		indata = 8'd12;
		
		#10;
		rst = 0;
		
		#500;
		$stop;
		
	end
	
	always #1 clk = ~clk;
      
endmodule

