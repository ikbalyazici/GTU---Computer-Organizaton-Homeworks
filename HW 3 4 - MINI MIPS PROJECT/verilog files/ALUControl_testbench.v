`timescale 1 ps / 1 ps

module ALUControl_testbench();

	reg [2:0] Funct;
	reg [2:0] ALUOp;
	wire [2:0] ALUCtr;
	
	
	ALUControl ALUCtrlinst (.ALUOp(ALUOp), .Funct(Funct), .ALUCtr(ALUCtr));
	
	initial
		begin
			Funct = 3'b000;
			ALUOp = 3'b111;
			
			#5 Funct = 3'b001;
			   ALUOp = 3'b111;
			
			#5 Funct = 3'b010;
				ALUOp = 3'b111;
			
			#5 Funct = 3'b011;
				ALUOp = 3'b111;
			
			#5 Funct = 3'b100;
				ALUOp = 3'b111;
			
			#5 Funct = 3'b101;
				ALUOp = 3'b111;
			
			#5 Funct = 3'b110;
				ALUOp = 3'b001;
			
			#5 Funct = 3'b111;
				ALUOp = 3'b000;
			
			#5 Funct = 3'b000;
				ALUOp = 3'b101;
			
			#5 Funct = 3'b001;
				ALUOp = 3'b100;
			
			#5 Funct = 3'b001;
				ALUOp = 3'b110;
			
			#5 Funct = 3'b001;
				ALUOp = 3'b110;
			
			#5 Funct = 3'b101;
				ALUOp = 3'b110;
			
			#5 Funct = 3'b100;
				ALUOp = 3'b001;
			
			#5 Funct = 3'b111;
				ALUOp = 3'b001;
			
		end
		
endmodule