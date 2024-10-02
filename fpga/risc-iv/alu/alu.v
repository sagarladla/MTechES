module alu
(
	input clk,
	input rst,
	input [3:0] a,
	input [3:0] b,
	input [2:0] opn,
	
	output reg [3:0] alu_out0,
	output reg [3:0] alu_out1,
	output reg [3:0] status
);

parameter ALU_ADD = 3'b000;
parameter ALU_SUB = 3'b001;
parameter ALU_MUL = 3'b010;
parameter ALU_AND = 3'b011;
parameter ALU_OR  = 3'b100;
parameter ALU_XOR = 3'b101;
parameter ALU_LT  = 3'b110;

wire [4:0] add_val;
wire [4:0] sub_val;
wire [7:0] mul_val;

always @(posedge clk)
	begin
		if (rst)
			begin
				alu_out0 <= 'h0;
				alu_out1 <= 'h0;
				status	 <= 'h0;
			end
		else
			begin
				case (opn)
					ALU_ADD:
						begin
							alu_out0  <= add_val[3:0];
							status[1] <= add_val[4];
						end
					ALU_SUB:
						begin
							alu_out0  <= sub_val[3:0];
							status[1] <= sub_val[4];
						end
					ALU_MUL:
						begin
							alu_out0  <= mul_val[3:0];
							alu_out1  <= mul_val[7:4];
						end
					ALU_AND:
						begin
							alu_out0  <= a & b;
						end
					ALU_OR:
						begin
							alu_out0  <= a | b;
						end
					ALU_XOR:
						begin
							alu_out0  <= a ^ b;
						end
					ALU_LT:
						begin
							status[2] <= (a < b) ? 1'b1 : 1'b0;
						end
				endcase
			end
	end
assign add_val = a + b;
assign sub_val = a - b;
assign mul_val = a * b;
endmodule
