module mux2x1(D0,D1,S,F);

	input D0;
	input D1;
	input S;
	output F;
	
	wire And1;
	wire And2;
	wire SNot;
	
	not (SNot, S);
	and a1(And1,SNot,D0);
	and a2(And2,S,D1);
	or o1 (F,And1,And2);

endmodule
