module programCounter (prepc, pc);
	
	wire C;
	input [31:0] prepc;
	output [31:0] pc;
	
	_32bitadder adder (pc[31:0], C, prepc[31:0], 32'b00000000000000000000000000000001, 1'b0);
	
endmodule