module RegisterMux (rt, rd, RegDst, RW);

	input [2:0] rt;
	input [2:0] rd;
	input RegDst;
	output [2:0] RW;
	
	mux2x1 m0 (rt[0], rd[0], RegDst, RW[0]);
	mux2x1 m1 (rt[1], rd[1], RegDst, RW[1]);
	mux2x1 m2 (rt[2], rd[2], RegDst, RW[2]);

endmodule
