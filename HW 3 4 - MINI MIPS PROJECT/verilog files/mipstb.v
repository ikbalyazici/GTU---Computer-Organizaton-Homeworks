`timescale 1 ps / 1 ps

module mipstb ();

	//wire C;
	wire [31:0] result;
	//reg [31:0] pc;
	//wire [31:0] newpc;
	reg [15:0] instruction;
	//reg [15:0] instruction_set [25:0];
	
	miniMips mipsinst (.instruction(instruction),.result(result));
	
	initial	
		begin
		
			//pc = 32'b00000000000000000000000000000001;
			//$readmemb ("C:/altera/13.1/workspace/hw4/instruction_list.txt",instruction_set);
			$readmemb("C:/altera/13.1/workspace/hw4/reg_inside.txt",mipstb.mipsinst.regiss.storage);
			$readmemb("C:/altera/13.1/workspace/hw4/mem_inside.txt",mipstb.mipsinst.memo.storage);
			
			instruction = 32'b0000000001010000; // 000 ve 001 i andle 010 a yaz
			#20 instruction = 32'b0000000010011000; // 000 ve 010 ı andle 011 e yaz
			#20 instruction = 32'b0000000011100001; // 000 + 011 -> 100
			#20 instruction = 32'b0000000100101001; // 000 + 100 -> 101
			#20 instruction = 32'b0000101000110010; // 101 - 000 -> 110
			#20 instruction = 32'b0000110000111010; // 110 - 000 -> 111
			#20 instruction = 32'b0000000111001011; // 000 xor 111 -> 001
			#20 instruction = 32'b0000000001010011; // 000 xor 001 -> 010
			#20 instruction = 32'b0000000010011100; // 000 nor 010 -> 011
			#20 instruction = 32'b0000000011100100; // 000 nor 011 -> 100
			#20 instruction = 32'b0000000100101101; // 000 or 100 -> 101
			#20 instruction = 32'b0000000101110101; // 000 or 101 -> 110
			#20 instruction = 32'b0001000110111110;  // 000 + 111110 -> 110
			#20 instruction = 32'b0001000111001110; // 000 + 001110 -> 111
			#20 instruction = 32'b0010000001010111; // 000 and 010111 -> 001
			#20 instruction = 32'b0010000010011111; // 000 and 011111 -> 010
			#20 instruction = 32'b0011000011100000; // 000 or 100000 -> 011
			#20 instruction = 32'b0011000100101000; // 000 or 101000 -> 100
			#20 instruction = 32'b0100000101110001; // 000 nor 110001 -> 101
			#20 instruction = 32'b0100000110111001; // 000 nor 111001 -> 110
			#20 instruction = 32'b0111000100101100; // 000 slt 101100 -> 100
			#20 instruction = 32'b0111000101110100; // 000 slt 110100 -> 101
			#20 instruction = 32'b1000000110111101; // mem[111101] -> 110
			#20 instruction = 32'b1000000111001101; // mem [001101] -> 111
			#20 instruction = 32'b1001000001010110; // 001 -> mem [010110] 
			#20 instruction = 32'b1001000010011110; // 010 -> mem [011110]
		
		end
		
		
	
	always @*
		begin
			$writememb("reg_end.txt",mipstb.mipsinst.regiss.storage);
			$writememb("mem_end.txt",mipstb.mipsinst.memo.storage);
			$display("time: %d, instruction: %b, result: %b\n", $time,instruction,result);
		end
	
	
	
endmodule
