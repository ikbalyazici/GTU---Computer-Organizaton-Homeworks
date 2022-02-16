`timescale 1 ps / 1 ps

module controlunit_testbench();

	reg [3:0] opcode;
	wire [2:0] ALUOp;
	wire RegDst;
	wire MemRead;
	wire MemToReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	
	controlunit ctrlinst (.opcode(opcode), .ALUOp(ALUOp), .RegDst(RegDst), .MemRead(MemRead), .MemToReg(MemToReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
	
	initial
		begin
			opcode = 4'b0000;
			
			#5 opcode = 4'b0001;
			
			#5 opcode = 4'b0010;
			
			#5 opcode = 4'b0011;
			
			#5 opcode = 4'b0100;
			
			#5 opcode = 4'b0101;
			
			#5 opcode = 4'b0110;
			
			#5 opcode = 4'b0111;
			
			#5 opcode = 4'b1000;
			
			#5 opcode = 4'b1001;
			
		end
		
endmodule