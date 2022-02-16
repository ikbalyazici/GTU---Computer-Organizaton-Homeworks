`timescale 1 ps / 1 ps

module signExtender_testbench();

	reg [5:0] imm;
	wire [31:0] signExtImm;
	
	signExtender signExtInst (.imm(imm), .signExtImm(signExtImm));
	
	initial
		begin
			imm = 6'b000011;
			
			#5 imm = 6'b000111;
			
			#5 imm = 6'b001011;
			
			#5 imm = 6'b001111;
			
			#5 imm = 6'b011100;
			
			#5 imm = 6'b010111;
			
			#5 imm = 6'b011011;
			
			#5 imm = 6'b011111;
			
			#5 imm = 6'b100011;
			
			#5 imm = 6'b100111;
			
			#5 imm = 6'b111111;
			
		end
		
endmodule