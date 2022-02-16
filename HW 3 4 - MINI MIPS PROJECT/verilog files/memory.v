module memory (MemRead, MemWrite, Address, WriteData, ReadData);

	input MemRead;
	input MemWrite;
	input [31:0] Address;
	input [31:0] WriteData;
	output reg [31:0] ReadData;
	
	reg [31:0] storage [255:0];

		
	always @*
		begin
			if(MemRead)
			begin
				ReadData <= storage[Address];
			end
		end
	
	always @*
		begin
			if(MemWrite)
			begin
				storage[Address] <= WriteData;
			end
		end

endmodule