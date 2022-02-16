module Registers (RegWrite, RegReadA, RegReadB, WriteRegister, WriteData, ReadDataA, ReadDataB);

	input RegWrite;
	input [2:0] RegReadA;
	input [2:0] RegReadB;
	input [2:0] WriteRegister;
	input [31:0] WriteData;
	//input clk;
	output reg [31:0] ReadDataA;
	output reg [31:0] ReadDataB;
	
	reg [31:0] storage [7:0];
	
	always @*
		begin
			if(RegReadA[2] == 1'b0 & RegReadA[1] == 1'b0 & RegReadA[0] == 1'b0)
				 ReadDataA = storage[0];
			
			else if (RegReadA[2] == 1'b0 & RegReadA[1] == 1'b0 & RegReadA[0] == 1'b1)
				 ReadDataA = storage[1];
				
			else if (RegReadA[2] == 1'b0 & RegReadA[1] == 1'b1 & RegReadA[0] == 1'b0)
				 ReadDataA = storage[2];
			
			else if (RegReadA[2] == 1'b0 & RegReadA[1] == 1'b1 & RegReadA[0] == 1'b1)
				 ReadDataA = storage[3];
			
			else if (RegReadA[2] == 1'b1 & RegReadA[1] == 1'b0 & RegReadA[0] == 1'b0)
				 ReadDataA = storage[4];
			
			else if (RegReadA[2] == 1'b1 & RegReadA[1] == 1'b0 & RegReadA[0] == 1'b1)
				 ReadDataA = storage[5];
			
			else if (RegReadA[2] == 1'b1 & RegReadA[1] == 1'b1 & RegReadA[0] == 1'b0)
				 ReadDataA = storage[6];
			
			else if (RegReadA[2] == 1'b1 & RegReadA[1] == 1'b1 & RegReadA[0] == 1'b1)
				 ReadDataA = storage[7];
		end
			
	always @*
		begin
			if(RegReadB[2] == 1'b0 & RegReadB[1] == 1'b0 & RegReadB[0] == 1'b0)
				 ReadDataB = storage[0];
			
			else if (RegReadB[2] == 1'b0 & RegReadB[1] == 1'b0 & RegReadB[0] == 1'b1)
				 ReadDataB = storage[1];
				
			else if (RegReadB[2] == 1'b0 & RegReadB[1] == 1'b1 & RegReadB[0] == 1'b0)
				 ReadDataB = storage[2];
			
			else if (RegReadB[2] == 1'b0 & RegReadB[1] == 1'b1 & RegReadB[0] == 1'b1)
				 ReadDataB = storage[3];
			
			else if (RegReadB[2] == 1'b1 & RegReadB[1] == 1'b0 & RegReadB[0] == 1'b0)
				 ReadDataB = storage[4];
			
			else if (RegReadB[2] == 1'b1 & RegReadB[1] == 1'b0 & RegReadB[0] == 1'b1)
				 ReadDataB = storage[5];
			
			else if (RegReadB[2] == 1'b1 & RegReadB[1] == 1'b1 & RegReadB[0] == 1'b0)
				 ReadDataB = storage[6];
			
			else if (RegReadB[2] == 1'b1 & RegReadB[1] == 1'b1 & RegReadB[0] == 1'b1)
				 ReadDataB = storage[7];
		end
			
	always @*
		begin
			if (RegWrite)
				begin
					if (WriteRegister[2] == 1'b0 & WriteRegister[1] == 1'b0 & WriteRegister[0] == 1'b0)
						 storage[0] = WriteData;
					
					else if (WriteRegister[2] == 1'b0 & WriteRegister[1] == 1'b0 & WriteRegister[0] == 1'b1)
						 storage[1] = WriteData;
						
					else if (WriteRegister[2] == 1'b0 & WriteRegister[1] == 1'b1 & WriteRegister[0] == 1'b0)
						 storage[2] = WriteData;
						
					else if (WriteRegister[2] == 1'b0 & WriteRegister[1] == 1'b1 & WriteRegister[0] == 1'b1)
						 storage[3] = WriteData;
					
					else if (WriteRegister[2] == 1'b1 & WriteRegister[1] == 1'b0 & WriteRegister[0] == 1'b0)
						 storage[4] = WriteData;
					
					else if (WriteRegister[2] == 1'b1 & WriteRegister[1] == 1'b0 & WriteRegister[0] == 1'b1)
						 storage[5] = WriteData;
						
					else if (WriteRegister[2] == 1'b1 & WriteRegister[1] == 1'b1 & WriteRegister[0] == 1'b0)
						 storage[6] = WriteData;
					
					else if (WriteRegister[2] == 1'b1 & WriteRegister[1] == 1'b1 & WriteRegister[0] == 1'b1)
						 storage[7] = WriteData;
				end
		end

endmodule
