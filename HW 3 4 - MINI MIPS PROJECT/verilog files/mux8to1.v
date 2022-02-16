module mux8to1(D0,D1,D2,D3,D4,D5,D6,D7,S0,S1,S2,F);

	input D0;
	input D1;
	input D2;
	input D3;
	input D4;
	input D5;
	input D6;
	input D7;
	input S0;
	input S1;
	input S2;
	output F;
	
	wire And0;
	wire And1;
	wire And2;
	wire And3;
	wire And4;
	wire And5;
	wire And6;
	wire And7;
	
	wire S0Not;
	wire S1Not;
	wire S2Not;
	
	not (S0Not, S0);
	not (S1Not, S1);
	not (S2Not, S2);
	
	and a0(And0, S0Not, S1Not, S2Not ,D0); //000
	and a1(And1, S0Not, S1Not, S2, D1);		//001
	and a2(And2, S0Not, S1, S2Not, D2);		//010
	and a3(And3, S0Not, S1, S2, D3);			//011
	and a4(And4, S0, S1Not, S2Not, D4);		//100
	and a5(And5, S0, S1Not, S2, D5);			//101
	and a6(And6, S0, S1, S2Not, D6);			//110
	and a7(And7, S0, S1, S2, D7);				//111
	
	or o1 (F,And0,And1,And2,And3,And4,And5,And6,And7);

endmodule
