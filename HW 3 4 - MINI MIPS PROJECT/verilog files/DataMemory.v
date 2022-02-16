module DataMemory (MemRead, MemWrite, Address, WriteData, ReadData);

	input MemRead;
	input MemWrite;
	input [31:0] Address;
	input [31:0] WriteData;
	output [31:0] ReadData;
	
endmodule 