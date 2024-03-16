`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:48:52 03/16/2024
// Design Name:   memram
// Module Name:   C:/Users/souza/Desktop/processador/vsprocessor/memram_tb.v
// Project Name:  vsprocessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memram_tb;
	// Inputs
	reg clk;
	reg wren;
	reg [3:0] address;
	reg [7:0] write_data;

	// Outputs
	wire [7:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	memram uut (
		.clk(clk), 
		.wren(wren), 
		.address(address), 
		.write_data(write_data), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		wren = 0;
		address = 0;
		write_data = 0;
		
		#10
		wren = 1;
		address = 4'h0;
		write_data = 8'd52;
		
		#15;
		address = 4'h1;
		write_data = 8'd27;
		
		#20;
		address = 4'h2;
		write_data = 8'd80;
		
		#25;
		wren = 0;
		
		#30;
		address = 4'h1;
		
		#35;
		address = 4'h2;
		
		#40;
		address = 4'h3;
		
		#50;
		$stop;
	end
	
	always #1 clk = ~clk;
      
endmodule

