module controlunit(opcode,ALUOp,RegDst,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite);

	input [3:0] opcode;
	output [2:0] ALUOp;
	output RegDst;
	output MemRead;
	output MemToReg;
	output MemWrite;
	output ALUSrc;
	output RegWrite;
	
	wire ALUOpAA;
	wire ALUOpBA;
	wire ALUOpBB;
	wire ALUOpCA;
	wire ALUOpCB;
	wire ALUOpX;
	wire notOpcodeB;
	wire notAllOpcodes;
	wire notOpcodeD;
	wire RegWriteA;
	wire RegWriteB;
	wire notRegWrite;
	wire srcxor;
	wire srcand;
	wire srcnot;
	
	//ALUOp0
	not notC(notOpcodeB, opcode[2]);
	and andALUOpAA (ALUOpAA, notOpcodeB, opcode[0]);
	or orALUOpX (ALUOpX, opcode[3], opcode[2], opcode[1], opcode[0]);
	not notAll (notAllOpcodes, ALUOpX);
	or orALUOpA(ALUOp[0], opcode[3], ALUOpAA, notAllOpcodes);
	
	//ALUOp1
	or orALUOpBA (ALUOpBA, opcode[1], opcode[0]);
	and andALUOPBB (ALUOpBB, ALUOpBA, opcode[2]);
	or orALUOpB (ALUOp[1],notAllOpcodes, ALUOpBB);
	
	//ALUOp2
	and andALUOpCA (ALUOpCA, opcode[1], opcode[0]);
	or orALUOpCB (ALUOpCB, ALUOpCA, opcode[2]);
	or orALUOpC (ALUOp[2], ALUOpCB, notAllOpcodes);
	
	//MemWrite
	and andMemWrite (MemWrite, opcode[3], opcode[0]);
	
	//MemRead
	not notD (notOpcodeD, opcode[0]);
	and andMemRead (MemRead, opcode[3], notOpcodeD);
	
	//RegDst
	not setRegDst (RegDst, ALUOpX);
	
	//MemtoReg
	and andMemtoReg (MemToReg, opcode[3], notOpcodeD);
	
	
	//RegWrite 
	xor xorRegWriteA (RegWriteA, opcode[3], opcode[2]);
	xor xorRegWriteB (RegWriteB, opcode[1], opcode[0]);
	and andAB (notRegWrite, RegWriteA, RegWriteB);
	not setRegWrite (RegWrite, notRegWrite);
	
	//ALUSrc
	xor srcxorr (srcxor, opcode[1], opcode[0]);
	and srcandd (srcand, srcxor, opcode[2]);
	or (srcnot, srcand, notAllOpcodes);
	not (ALUSrc, srcnot);

endmodule
