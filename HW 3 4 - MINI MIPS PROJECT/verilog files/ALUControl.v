module ALUControl(ALUOp, Funct, ALUCtr);
	
	input [2:0] ALUOp;
	input [2:0] Funct;
	output [2:0] ALUCtr;
	
	wire andresult;
	wire muxresultA;
	wire muxresultB;
	wire muxresultC;
	
	and aluand (andresult, ALUOp[2], ALUOp[1], ALUOp[0]);
	mux2x1 m1 (ALUOp[0], Funct[0], andresult, muxresultA);
	mux2x1 m2 (ALUOp[1], Funct[1], andresult, muxresultB);
	mux2x1 m3 (ALUOp[2], Funct[2], andresult, muxresultC);
	
	or or1 (ALUCtr[0], muxresultA, 1'b0);
	or or2 (ALUCtr[1], muxresultB, 1'b0);
	or or3 (ALUCtr[2], muxresultC, 1'b0);
	
endmodule
