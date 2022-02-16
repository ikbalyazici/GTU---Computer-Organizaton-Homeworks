module WriteToRegMux (AluResult,MemData,MemToReg,R);

	input [31:0] AluResult;
	input [31:0] MemData;
	input MemToReg;
	output [31:0] R;
	
	mux2x1 m0 (AluResult[0], MemData[0], MemToReg, R[0]);
	mux2x1 m1 (AluResult[1], MemData[1], MemToReg, R[1]);
	mux2x1 m2 (AluResult[2], MemData[2], MemToReg, R[2]);
	mux2x1 m3 (AluResult[3], MemData[3], MemToReg, R[3]);
	mux2x1 m4 (AluResult[4], MemData[4], MemToReg, R[4]);
	mux2x1 m5 (AluResult[5], MemData[5], MemToReg, R[5]);
	mux2x1 m6 (AluResult[6], MemData[6], MemToReg, R[6]);
	mux2x1 m7 (AluResult[7], MemData[7], MemToReg, R[7]);
	mux2x1 m8 (AluResult[8], MemData[8], MemToReg, R[8]);
	mux2x1 m9 (AluResult[9], MemData[9], MemToReg, R[9]);
	mux2x1 m10 (AluResult[10], MemData[10], MemToReg, R[10]);
	mux2x1 m11 (AluResult[11], MemData[11], MemToReg, R[11]);
	mux2x1 m12 (AluResult[12], MemData[12], MemToReg, R[12]);
	mux2x1 m13 (AluResult[13], MemData[13], MemToReg, R[13]);
	mux2x1 m14 (AluResult[14], MemData[14], MemToReg, R[14]);
	mux2x1 m15 (AluResult[15], MemData[15], MemToReg, R[15]);
	mux2x1 m16 (AluResult[16], MemData[16], MemToReg, R[16]);
	mux2x1 m17 (AluResult[17], MemData[17], MemToReg, R[17]);
	mux2x1 m18 (AluResult[18], MemData[18], MemToReg, R[18]);
	mux2x1 m19 (AluResult[19], MemData[19], MemToReg, R[19]);
	mux2x1 m20 (AluResult[20], MemData[20], MemToReg, R[20]);
	mux2x1 m21 (AluResult[21], MemData[21], MemToReg, R[21]);
	mux2x1 m22 (AluResult[22], MemData[22], MemToReg, R[22]);
	mux2x1 m23 (AluResult[23], MemData[23], MemToReg, R[23]);
	mux2x1 m24 (AluResult[24], MemData[24], MemToReg, R[24]);
	mux2x1 m25 (AluResult[25], MemData[25], MemToReg, R[25]);
	mux2x1 m26 (AluResult[26], MemData[26], MemToReg, R[26]);
	mux2x1 m27 (AluResult[27], MemData[27], MemToReg, R[27]);
	mux2x1 m28 (AluResult[28], MemData[28], MemToReg, R[28]);
	mux2x1 m29 (AluResult[29], MemData[29], MemToReg, R[29]);
	mux2x1 m30 (AluResult[30], MemData[30], MemToReg, R[30]);
	mux2x1 m31 (AluResult[31], MemData[31], MemToReg, R[31]);
	
endmodule
