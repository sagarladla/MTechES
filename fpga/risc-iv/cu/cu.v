module cu(
	input clk,
	input rst,
	input [3:0] opcode,		// 4 bit opcode from instruction
	
	output reg reg_write,		// register write enable
	output reg alu_src,		// alu source (1: immediate/memory; 0: register)
	output reg mem_read,		// memory read enable
	output reg mem_write,		// memory write enable
	output reg mem_to_reg,		// memory to register enable (copy data from memory to register)
	output reg [2:0] alu_opn	// ALU operation code to send to ALU module
);

parameter ALU_ADD	= 4'b0000;
parameter ALU_SUB	= 4'b0001;
parameter ALU_MUL	= 4'b0010;
parameter ALU_AND	= 4'b0011;
parameter ALU_OR	= 4'b0100;
parameter ALU_XOR	= 4'b0101;
parameter ALU_LT	= 4'b0110;
parameter LOAD		= 4'b0111;
parameter STORE		= 4'b1000;

always @(posedge clk) begin
	if (rst) begin
		reg_write	<= 1'b0;
		alu_src		<= 1'b0;
		mem_read	<= 1'b0;
		mem_write	<= 1'b0;
		mem_to_reg	<= 1'b0;
		alu_opn		<= 3'd0;
	end
	else begin
		reg_write	<= 1'b0;
		alu_src		<= 1'b0;
		mem_read	<= 1'b0;
		mem_write	<= 1'b0;
		mem_to_reg	<= 1'b0;
		alu_opn		<= 3'd0;
		case (opcode)
			ALU_ADD:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b000;
				end
			ALU_SUB:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b001;
				end
			ALU_MUL:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b010;
				end
			ALU_AND:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b011;
				end
			ALU_OR:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b100;
				end
			ALU_XOR:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b101;
				end
			ALU_LT:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b0;
					alu_opn		<= 3'b110;
				end
			LOAD:
				begin
					reg_write	<= 1'b1;
					alu_src		<= 1'b1;
					mem_read	<= 1'b1;
					mem_to_reg	<= 1'b1;
				end
			STORE:
				begin
					alu_src		<= 1'b1;
					mem_write	<= 1'b1;
				end
		endcase
	end
end
endmodule
