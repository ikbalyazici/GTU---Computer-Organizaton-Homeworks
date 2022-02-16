module instructions (pc, instruction);
	
	input [31:0] pc;
	output reg [15:0] instruction;
	
	reg [15:0] instruction_set [25:0];
	
	always @*
		begin
			instruction <= instruction_set[pc];
		end
	
	

endmodule