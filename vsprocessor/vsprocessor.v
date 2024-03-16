`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:14 03/16/2024 
// Design Name: 
// Module Name:    vsprocessor 
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
module vsprocessor (clk, rst, indata, outdata, a_value, pc_value, ir_value);
	input clk, rst;
	input [7:0] indata;
	output [7:0] outdata, a_value, pc_value;
	output [12:0] ir_value;
	
	reg [12:0] ir;
	reg [7:0] acc, rout, pc, spc;
	reg [4:0] state;
	reg wram;
	
	wire [12:0] rom_data;
	wire [7:0] ram_data;
	
	memram regfile (.clk(clk), .wren(wram), .address(ir[5:0]), .write_data(acc), .read_data(ram_data));
	memrom meminst (.address(pc), .data(rom_data));
	
	assign outdata = rout;
	assign a_value = acc;
	assign pc_value = pc;
	assign ir_value = ir;
	
	parameter inicio = 0,
				 busca = 1,
				 decodifica = 2,
				 
				 Add = 3,
				 Sub = 4,
				 And = 5,
				 Or = 6,
				 Xor = 7,
				 Shl = 7,
				 Shr = 8,
				 Comp = 9,
				 
				 Addi = 10,
				 Subi = 11,
				 Andi = 12,
				 Ori = 13,
				 Xori = 14,
				 Shli = 15,
				 Shri = 16,				 
				 
				 Lda = 17,
				 Ldi = 18,
				 Sta = 19,
				 
				 Goto = 20,
				 Skifz = 21,
				 Skifn = 22,
				 
				 Call = 23,
				 Ret = 24,
				 
				 In = 25,
				 Out = 26,
				 
				 Halt = 27,
				 
				 sincroniza = 31;
	
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			state = inicio;
			pc = 8'h00;
			spc = 8'h00;
			ir = 13'h0000;
			acc = 8'h00;
			rout = 8'h00;
			wram = 1'b0;
		end
		
		else begin
			case(state)
				//Inicio
				inicio: begin
					pc = 8'h00;
					spc = 8'h00;
					ir = 13'h0000;
					acc = 8'h00;
					rout = 8'h00;
					wram = 1'b0;
					state = busca;
				end
				
				//Busca
				busca: begin
					pc = pc + 8'd1;
					ir = rom_data;
					wram = 1'b0;
					state = decodifica;
				end
				
				//Decodifica
				decodifica: begin
					if(ir[12:8] == 5'h00) state = Add;
					else if(ir[12:8] == 5'h01) state = Sub;
					else if(ir[12:8] == 5'h02) state = And;
					else if(ir[12:8] == 5'h03) state = Or;
					else if(ir[12:8] == 5'h04) state = Xor;
					else if(ir[12:8] == 5'h05) state = Shl;
					else if(ir[12:8] == 5'h06) state = Shr;
					else if(ir[12:8] == 5'h07) state = Comp;
					
					else if(ir[12:8] == 5'h08) state = Addi;
					else if(ir[12:8] == 5'h09) state = Subi;
					else if(ir[12:8] == 5'h0A) state = Andi;
					else if(ir[12:8] == 5'h0B) state = Ori;
					else if(ir[12:8] == 5'h0C) state = Xori;
					else if(ir[12:8] == 5'h0D) state = Shli;
					else if(ir[12:8] == 5'h0E) state = Shri;
					
					else if(ir[12:8] == 5'h10) state = Lda;
					else if(ir[12:8] == 5'h11) state = Ldi;
					else if(ir[12:8] == 5'h12) state = Sta;
					
					else if(ir[12:8] == 5'h15) state = Goto;
					else if(ir[12:8] == 5'h16) state = Skifz;
					else if(ir[12:8] == 5'h17) state = Skifn;
					
					else if(ir[12:8] == 5'h1A) state = Call;
					else if(ir[12:8] == 5'h1B) state = Ret;
					
					else if(ir[12:8] == 5'h1D) state = In;
					else if(ir[12:8] == 5'h1E) state = Out;
					
					else if(ir[12:8] == 5'h1F) state = Halt;
					else state = busca;
				end
				
				//Instrucao Add
				Add: begin
					acc = acc + ram_data;
					state = busca;
				end
				
				//Instrucao Sub
				Sub: begin
					acc = acc - ram_data;
					state = busca;
				end
				
				//Instrucao And
				And: begin
					acc = acc & ram_data;
					state = busca;
				end
				
				//Instrucao Or
				Or: begin
					acc = acc | ram_data;
					state = busca;
				end
				
				//Instrucao Xor
				Xor: begin
					acc = acc ^ ram_data;
					state = busca;
				end			
				
				//Instrucao Shl
				Shl: begin
					acc = acc << ram_data;
					state <= busca;
				end
				
				//Instrucao Shr
				Shr: begin
					acc = acc >> ram_data;
					state = busca;
				end
				
				//Instrucao Comp
				Comp: begin
					acc = ~acc;
					state = busca;
				end

				//Instrucao Addi
				Addi: begin
					acc = acc + ir[7:0];
					state = busca;
				end
				
				//Instrucao Subi
				Subi: begin
					acc = acc - ir[7:0];
					state = busca;
				end
				
				//Instrucao Andi
				Andi: begin
					acc = acc & ir[7:0];
					state = busca;
				end
				
				//Instrucao Ori
				Ori: begin
					acc = acc | ir[7:0];
					state = busca;
				end
				
				//Instrucao Xori
				Xori: begin
					acc = acc ^ ir[7:0];
					state = busca;
				end			
				
				//Instrucao Shli
				Shli: begin
					acc = acc << ir[7:0];
					state = busca;
				end
				
				//Instrucao Shri
				Shri: begin
					acc = acc >> ir[7:0];
					state = busca;
				end
				
				//Instrucao LDA
				Lda: begin
					acc = ram_data;
					state = busca;
				end
				
				//Instrucao LDI
				Ldi: begin
					acc = ir[7:0];
					state = busca;
				end
				
				//Instrucao Sta
				Sta: begin
					wram = 1'b1;
					state = busca;
				end
				
				//Instrucao Goto
				Goto: begin
					pc = ir[7:0];
					state = sincroniza;
				end
				
				//Instrucao Skifz
				Skifz: begin
					if(acc == 8'h00) begin
						pc = pc + 8'd1;
						state = sincroniza;
					end
					else state = busca;
				end
				
				//Instrucao Skifn
				Skifn: begin
					if(acc[7] == 1'b1) begin
						pc = pc + 8'd1;
						state = sincroniza;
					end
					else state = busca;
				end			
				
				//Instrucao Call
				Call: begin
					spc = pc;
					pc = ir[7:0];
					state = sincroniza;
				end
				
				//Instrucao Ret
				Ret: begin
					pc = spc;
					state = sincroniza;
				end
				
				//Instrucao In
				In: begin
					acc = indata;
					state = busca;
				end
				
				//Instrucao In
				Out: begin
					rout = acc;
					state = busca;
				end
				
				//Instrucao Halt
				Halt: state = Halt;
				
				//Instrucao Sincroniza
				sincroniza: begin
					state = busca;
				end
				
				//Default
				default: state = inicio;
			
			endcase
		end
	end

endmodule
	