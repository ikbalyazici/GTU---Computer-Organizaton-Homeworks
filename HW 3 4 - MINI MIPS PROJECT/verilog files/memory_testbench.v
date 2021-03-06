`timescale 1 ps / 1 ps

module memory_testbench();

	reg MemRead;
	reg MemWrite;
	reg [31:0] Address;
	reg [31:0] WriteData;
	wire [31:0] ReadData;
	
	
	memory Meminst (.MemWrite(MemWrite), .MemRead(MemRead), .Address(Address), .WriteData(WriteData), .ReadData(ReadData));
	
	initial
		begin
			
			MemRead = 1'b1;
			MemWrite = 1'b0;
			Address = 32'b00000000000000000000000000000011;
			WriteData = 32'b01010101010101010101010101000000;
			
			#5 MemRead = 1'b0;
				MemWrite = 1'b1;
				Address = 32'b00000000000000000000000000000011;
				WriteData = 32'b01010101010101010101010101000000;
			
			#5 MemRead = 1'b1;
				MemWrite = 1'b0;
				Address = 32'b00000000000000000000000000000011;
				WriteData = 32'b01010101010101010101010101000000;
			
			#5 MemRead = 1'b1;
				MemWrite = 1'b0;
				Address = 32'b00000000000000000000000000000111;
				WriteData = 32'b01010101010101010101010101000000;
				
			#5 MemRead = 1'b1;
				MemWrite = 1'b1;
				Address = 32'b00000000000000000000000000000111;
				WriteData = 32'b01010101010101010101010101000000;
		end
		
		initial $writememb("C:/altera/13.1/workspace/hw4/mem_inside.txt",memory_testbench.Meminst.storage);
		
endmodule