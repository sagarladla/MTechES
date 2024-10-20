module tb_cu;

reg clk, rst;
reg [3:0] opcode;

wire reg_write, alu_src, mem_read, mem_write, mem_to_reg;
wire [2:0] alu_opn;

always #5 clk = ~clk;

initial 
	begin
		clk = 0;
		rst = 1;
		opcode = 4'b0000;
		
		#20
		rst = 0;
		
		#10
		opcode = 4'b0001;
		
		#20
		opcode = 4'b0111;
		
		#10
		opcode = 4'b1000;
	end
cu UUT
(
	.clk(clk),
	.rst(rst),
	.opcode(opcode),
	
	.reg_write(reg_write),
	.alu_src(alu_src),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_to_reg(mem_to_reg),
	.alu_opn(alu_opn)
);
endmodule
