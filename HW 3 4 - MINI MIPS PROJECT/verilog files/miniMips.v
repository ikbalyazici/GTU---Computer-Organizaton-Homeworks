module miniMips (instruction,result);
	
	output [31:0] result;
	input [15:0] instruction;
	
	//wire [31:0] pc;
	wire [2:0] ALUOp;
	wire RegDst;
	wire MemRead;
	wire MemToReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	
	wire [2:0] WriteRegister;
	wire [31:0] WriteData;
	
	wire [31:0] ReadDataA;
	wire [31:0] ReadDataB;
	wire [31:0] signExtImm;
	
	wire [2:0] ALUCtr;
	
	wire [31:0] B;
	wire [31:0] R;
	
	wire [31:0] MemRes;
	
	controlunit ctrl (
		.opcode(instruction[15:12]), 
		.ALUOp(ALUOp),
		.RegDst(RegDst),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite)
		);
		
		RegisterMux remx (.rt(instruction[8:6]), .rd(instruction[5:3]), .RegDst(RegDst), .RW(WriteRegister[2:0]));
		
		Registers regiss (.RegWrite(RegWrite), .RegReadA(instruction[11:9]), .RegReadB(instruction[8:6]), .WriteRegister(WriteRegister), 
								.WriteData(WriteData), .ReadDataA(ReadDataA), .ReadDataB(ReadDataB));

		signExtender sExt (.imm(instruction[5:0]), .signExtImm(signExtImm));
		
		ALUControl ALUctrl(.ALUOp(ALUOp), .Funct(instruction[2:0]), .ALUCtr(ALUCtr));
	
		ALUSrcMux ALMX (.RegData(ReadDataB),.SignExtImm(signExtImm),.ALUSrc(ALUSrc),.R(B));
		
		alu al (.A(ReadDataA), .B(B), .Select(ALUCtr), .R(R));
		
		memory memo (.MemRead(MemRead), .MemWrite(MemWrite), .Address(R), .WriteData(ReadDataB), .ReadData(MemRes));
		
		WriteToRegMux WRMX (.AluResult(R), .MemData(MemRes), .MemToReg(MemToReg), .R(WriteData));
		
		orgate o1 (WriteData[31:0], 32'b00000000000000000000000000000000, result[31:0]);

endmodule
