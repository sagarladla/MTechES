module ffnn(
	// input layer
	input [7:0] h0,
	input [7:0] h1,
	input [7:0] h2,
	
	// out_0 weights
	input [7:0] h0w0,
	input [7:0] h1w0,
	input [7:0] h2w0,
	
	// out_1 weights
	input [7:0] h0w1,
	input [7:0] h1w1,
	input [7:0] h2w1,
	
	// out_0 bias
	input [7:0] out_0b,
	// out_1 bias
	input [7:0] out_1b,
	
	// output layer
	output reg [7:0] out_0,
	output reg [7:0] out_1
);
// temporary input wires to hold input * weight products of SOP part
// for output neuron 0
wire [7:0] out_00;
wire [7:0] out_01;
wire [7:0] out_02;
// for output neuron 1
wire [7:0] out_10;
wire [7:0] out_11;
wire [7:0] out_12;

// temporary input wires to hold summation of all input * weight
wire [7:0] out_0_sum;
wire [7:0] out_1_sum;

assign out_00 = h0 * h0w0;
assign out_01 = h1 * h1w0;
assign out_02 = h2 * h2w0;

assign out_10 = h0 * h0w1;
assign out_11 = h1 * h1w1;
assign out_12 = h2 * h2w1;

assign out_0_sum = out_00 + out_01 + out_02 + out_0b;
assign out_1_sum = out_10 + out_11 + out_12 + out_1b;

assign out_0 = out_0_sum;
assign out_1 = out_1_sum;

function [7:0] relu(input [7:0] sigma);
	begin
		relu = (sigma > 0) ? sigma : 0;
	end
endfunction
endmodule