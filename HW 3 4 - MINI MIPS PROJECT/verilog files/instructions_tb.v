`timescale 1 ps / 1 ps

module instruction_tb ();

	reg [31:0] pc;
	wire [15:0] instruction;
	
	instructions instinst (.pc(pc), .instruction(instruction));
	
	initial	
		begin

			$readmemb ("C:/altera/13.1/workspace/hw4/instruction_list.txt",instruction_tb.instinst.instruction_set);

			pc = 32'b00000000000000000000000000000000;
			
			#5 pc = 32'b00000000000000000000000000000001;
			
			#5 pc = 32'b00000000000000000000000000000010;
			
			#5 pc = 32'b00000000000000000000000000000011;
			
			#5 pc = 32'b00000000000000000000000000000100;
		end
endmodule
