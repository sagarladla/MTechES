module tb_alu;

reg clk, rst;
reg [3:0] a, b;
reg [2:0] opn;

wire [3:0] alu_out0, alu_out1, status;

// every 5ns clock will be inverted
// so 1 complete cycle will take - 10ns
// which is equal to 100 MHz clock
always #5 clk = ~clk;

initial 
	begin
		clk = 0;
		rst = 1;
		a = 0;
		b = 0;
		opn = 0;
		
		// 20ns delay
		#20
		rst = 0;
		
		// 10 ns delay
		#10
		a = 3;
		b = 7;
		opn = 0;
		
		// 20 ns delay
		#20
		a = 4;
		b = 5;
		opn = 3;
	end
alu UUT
(
	.clk(clk),
	.rst(rst),
	.a(a),
	.b(b),
	.opn(opn),
	
	.alu_out0(alu_out0),
	.alu_out1(alu_out1),
	.status(status)
);
endmodule
