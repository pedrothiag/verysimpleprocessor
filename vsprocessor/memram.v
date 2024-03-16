//////////////////////////////////////////////////////////////////////////////////
// Create Date:    17:47:28 03/16/2024 
// Design Name: 
// Module Name:    memram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memram (clk, wren, address, write_data, read_data);
	parameter address_length = 6;
	parameter data_length = 8;
	
	input clk, wren;
	input [address_length-1:0] address;
	input [data_length-1:0] write_data;

	output [data_length-1:0] read_data;

	reg [data_length-1:0] reg_file [2**address_length-1:0];

	always @(posedge clk) begin
		if (wren) reg_file[address] <= write_data;
	end

	assign read_data = reg_file[address];
endmodule