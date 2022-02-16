`timescale 1 ps / 1 ps

module Registers_testbench();

	reg RegWrite;
	reg [2:0] RegReadA;
	reg [2:0] RegReadB;
	reg [2:0] WriteRegister;
	reg [31:0] WriteData;
	wire [31:0] ReadDataA;
	wire [31:0] ReadDataB;
	
	
	Registers Reginst (.RegWrite(RegWrite), .RegReadA(RegReadA), .RegReadB(RegReadB), .WriteRegister(WriteRegister), 
							 .WriteData(WriteData), .ReadDataA(ReadDataA), .ReadDataB(ReadDataB));
	
	initial
		begin
			
			RegReadA = 3'b001;
			RegReadB = 3'b011;
			WriteRegister = 3'b011;
			WriteData = 32'b01010101010101010101010101000000;
			RegWrite = 1'b0;
			
			#5 RegReadA = 3'b010;
				RegReadB = 3'b011;
				WriteRegister = 3'b010;
				WriteData = 32'b01010101010101010101010101010101;
				RegWrite = 1'b1;
			
			#5 RegReadA = 3'b010;
				RegReadB = 3'b110;
				WriteRegister = 3'b111;
				WriteData = 32'b11111111111111111111110101010101;
				RegWrite = 1'b1;
				
			#5 RegReadA = 3'b010;
				RegReadB = 3'b110;
				WriteRegister = 3'b010;
				WriteData = 32'b11111111111111110000000000000000;
				RegWrite = 1'b0;
			
			#5 RegReadA = 3'b010;
				RegReadB = 3'b111;
				WriteRegister = 3'b111;
				WriteData = 32'b00000000000000001111111111111111;
				RegWrite = 1'b1;
				
			#5 RegReadA = 3'b010;
				RegReadB = 3'b011;
				WriteRegister = 3'b010;
				WriteData = 32'b11111111111111111111111111111111;
				RegWrite = 1'b0;
			
			#5 RegReadA = 3'b101;
				RegReadB = 3'b111;
				WriteRegister = 3'b111;
				WriteData = 32'b11111111111111111111111111111111;
				RegWrite = 1'b1;
		end
		
		initial $writememb("C:/altera/13.1/workspace/hw4/reg_inside.txt",Registers_testbench.Reginst.storage);
		
endmodule