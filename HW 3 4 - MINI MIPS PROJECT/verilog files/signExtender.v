module signExtender(imm, signExtImm);

	input [5:0] imm;
	output [31:0] signExtImm;
	
	or o00(signExtImm[0], 1'b0, imm[0]);
	or o01(signExtImm[1], 1'b0, imm[1]);
	or o02(signExtImm[2], 1'b0, imm[2]);
	or o03(signExtImm[3], 1'b0, imm[3]);
	or o04(signExtImm[4], 1'b0, imm[4]);
	or o05(signExtImm[5], 1'b0, imm[5]);
	or o06(signExtImm[6], 1'b0, 1'b0);
	or o07(signExtImm[7], 1'b0, 1'b0);
	or o08(signExtImm[8], 1'b0, 1'b0);
	or o09(signExtImm[9], 1'b0, 1'b0);
	or o10(signExtImm[10], 1'b0, 1'b0);
	or o11(signExtImm[11], 1'b0, 1'b0);
	or o12(signExtImm[12], 1'b0, 1'b0);
	or o13(signExtImm[13], 1'b0, 1'b0);
	or o14(signExtImm[14], 1'b0, 1'b0);
	or o15(signExtImm[15], 1'b0, 1'b0);
	or o16(signExtImm[16], 1'b0, 1'b0);
	or o17(signExtImm[17], 1'b0, 1'b0);
	or o18(signExtImm[18], 1'b0, 1'b0);
	or o19(signExtImm[19], 1'b0, 1'b0);
	or o20(signExtImm[20], 1'b0, 1'b0);
	or o21(signExtImm[21], 1'b0, 1'b0);
	or o22(signExtImm[22], 1'b0, 1'b0);
	or o23(signExtImm[23], 1'b0, 1'b0);
	or o24(signExtImm[24], 1'b0, 1'b0);
	or o25(signExtImm[25], 1'b0, 1'b0);
	or o26(signExtImm[26], 1'b0, 1'b0);
	or o27(signExtImm[27], 1'b0, 1'b0);
	or o28(signExtImm[28], 1'b0, 1'b0);
	or o29(signExtImm[29], 1'b0, 1'b0);
	or o30(signExtImm[30], 1'b0, 1'b0);
	or o31(signExtImm[31], 1'b0, 1'b0);

endmodule
