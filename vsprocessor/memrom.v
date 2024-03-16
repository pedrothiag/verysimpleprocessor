`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:59 03/16/2024 
// Design Name: 
// Module Name:    memrom 
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
//Verificar qual implementacao eh possivel em FPGA

/*module memrom (address, data);
	input [7:0] address;
	output reg [12:0] data;
	
	reg [12:0] rom[2**7-1:0];
	
	initial
	begin
		$readmemh("./codigos/perl.txt", rom);
	end
	
	always @* begin
		data <= rom[address];
	end
endmodule*/

module memrom (address, data);
	input [7:0] address;
	output reg [12:0] data;
	
	always @* begin
		case(address)
			//fibo.asm - Serve para Calcular a Serie de Fibonacci
			/*8'h00: data = 13'h1100;
			8'h01: data = 13'h1200;
			8'h02: data = 13'h1101;
			8'h03: data = 13'h1201;
			8'h04: data = 13'h1000;
			8'h05: data = 13'h0001;
			8'h06: data = 13'h1202;
			8'h07: data = 13'h1001;
			8'h08: data = 13'h1200;
			8'h09: data = 13'h1002;
			8'h0A: data = 13'h1201;
			8'h0B: data = 13'h1E00;
			8'h0C: data = 13'h1504;*/
			
			//pell.asm - Calcular parte inteira de uma raiz
			8'h00: data = 13'h1D00;
			8'h01: data = 13'h1200;
			8'h02: data = 13'h1100;
			8'h03: data = 13'h1201;
			8'h04: data = 13'h1101;
			8'h05: data = 13'h1202;
			8'h06: data = 13'h1000;
			8'h07: data = 13'h0102;
			8'h08: data = 13'h1200;
			8'h09: data = 13'h1002;
			8'h0A: data = 13'h0802;
			8'h0B: data = 13'h1202;
			8'h0C: data = 13'h1001;
			8'h0D: data = 13'h0801;
			8'h0E: data = 13'h1201;
			8'h0F: data = 13'h1000;
			8'h10: data = 13'h0102;
			8'h11: data = 13'h1700;
			8'h12: data = 13'h1506;
			8'h13: data = 13'h1001;
			8'h14: data = 13'h1E00;
			8'h15: data = 13'h1F00;
			
			//divo.asm - Calcular a divisao de dois numeros inteiros
			/*
			8'h00: data = 13'h0900;
			8'h01: data = 13'h0600;
			8'h02: data = 13'h0900;
			8'h03: data = 13'h0601;
			8'h04: data = 13'h0800;
			8'h05: data = 13'h0602;
			8'h06: data = 13'h0801;
			8'h07: data = 13'h0603;
			8'h08: data = 13'h0880;
			8'h09: data = 13'h0604;
			8'h0A: data = 13'h0700;
			8'h0B: data = 13'h0101;
			8'h0C: data = 13'h0204;
			8'h0D: data = 13'h050f;
			8'h0E: data = 13'h0416;
			8'h0F: data = 13'h0700;
			8'h10: data = 13'h0101;
			8'h11: data = 13'h0600;
			8'h12: data = 13'h0702;
			8'h13: data = 13'h0003;
			8'h14: data = 13'h0602;
			8'h15: data = 13'h040a;
			8'h16: data = 13'h0702;
			8'h17: data = 13'h0a00;
			8'h18: data = 13'h0b00;
			*/
			
			default: data = 13'h0000;
		endcase
	end
endmodule