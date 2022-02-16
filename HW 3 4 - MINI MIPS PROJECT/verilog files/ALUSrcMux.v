module ALUSrcMux (RegData,SignExtImm,ALUSrc,R);

	input [31:0] RegData;
	input [31:0] SignExtImm;
	input ALUSrc;
	output [31:0] R;
	
	mux2x1 m0 (RegData[0], SignExtImm[0], ALUSrc, R[0]);
	mux2x1 m1 (RegData[1], SignExtImm[1], ALUSrc, R[1]);
	mux2x1 m2 (RegData[2], SignExtImm[2], ALUSrc, R[2]);
	mux2x1 m3 (RegData[3], SignExtImm[3], ALUSrc, R[3]);
	mux2x1 m4 (RegData[4], SignExtImm[4], ALUSrc, R[4]);
	mux2x1 m5 (RegData[5], SignExtImm[5], ALUSrc, R[5]);
	mux2x1 m6 (RegData[6], SignExtImm[6], ALUSrc, R[6]);
	mux2x1 m7 (RegData[7], SignExtImm[7], ALUSrc, R[7]);
	mux2x1 m8 (RegData[8], SignExtImm[8], ALUSrc, R[8]);
	mux2x1 m9 (RegData[9], SignExtImm[9], ALUSrc, R[9]);
	mux2x1 m10 (RegData[10], SignExtImm[10], ALUSrc, R[10]);
	mux2x1 m11 (RegData[11], SignExtImm[11], ALUSrc, R[11]);
	mux2x1 m12 (RegData[12], SignExtImm[12], ALUSrc, R[12]);
	mux2x1 m13 (RegData[13], SignExtImm[13], ALUSrc, R[13]);
	mux2x1 m14 (RegData[14], SignExtImm[14], ALUSrc, R[14]);
	mux2x1 m15 (RegData[15], SignExtImm[15], ALUSrc, R[15]);
	mux2x1 m16 (RegData[16], SignExtImm[16], ALUSrc, R[16]);
	mux2x1 m17 (RegData[17], SignExtImm[17], ALUSrc, R[17]);
	mux2x1 m18 (RegData[18], SignExtImm[18], ALUSrc, R[18]);
	mux2x1 m19 (RegData[19], SignExtImm[19], ALUSrc, R[19]);
	mux2x1 m20 (RegData[20], SignExtImm[20], ALUSrc, R[20]);
	mux2x1 m21 (RegData[21], SignExtImm[21], ALUSrc, R[21]);
	mux2x1 m22 (RegData[22], SignExtImm[22], ALUSrc, R[22]);
	mux2x1 m23 (RegData[23], SignExtImm[23], ALUSrc, R[23]);
	mux2x1 m24 (RegData[24], SignExtImm[24], ALUSrc, R[24]);
	mux2x1 m25 (RegData[25], SignExtImm[25], ALUSrc, R[25]);
	mux2x1 m26 (RegData[26], SignExtImm[26], ALUSrc, R[26]);
	mux2x1 m27 (RegData[27], SignExtImm[27], ALUSrc, R[27]);
	mux2x1 m28 (RegData[28], SignExtImm[28], ALUSrc, R[28]);
	mux2x1 m29 (RegData[29], SignExtImm[29], ALUSrc, R[29]);
	mux2x1 m30 (RegData[30], SignExtImm[30], ALUSrc, R[30]);
	mux2x1 m31 (RegData[31], SignExtImm[31], ALUSrc, R[31]);
	
endmodule
