module ffnn(
	// input layer
	input [7:0] i0,
	input [7:0] i1,
	input [7:0] i2,
	input [7:0] i3,
	
	// h0 weights
	input [7:0] i0w0,
	input [7:0] i1w0,
	input [7:0] i2w0,
	input [7:0] i3w0,
	
	// h1 weights
	input [7:0] i0w1,
	input [7:0] i1w1,
	input [7:0] i2w1,
	input [7:0] i3w1,
	
	// h2 weights
	input [7:0] i0w2,
	input [7:0] i1w2,
	input [7:0] i2w2,
	input [7:0] i3w2,
	
	// h0 bias
	input [7:0] h0b,
	// h1 bias
	input [7:0] h1b,
	// h2 bias
	input [7:0] h2b,
	
	// hidden layer
	output reg [7:0] h0,
	output reg [7:0] h1,
	output reg [7:0] h2
);

// temporary input wires to hold input * weight products of SOP part
// temporary input wires to hold input * weight products of SOP part
// for hidden neuron 0
wire [7:0] h00;
wire [7:0] h01;
wire [7:0] h02;
wire [7:0] h03;
// for hidden neuron 1
wire [7:0] h10;
wire [7:0] h11;
wire [7:0] h12;
wire [7:0] h13;
// for hidden neuron 2
wire [7:0] h20;
wire [7:0] h21;
wire [7:0] h22;
wire [7:0] h23;

// for SOP result
reg [7:0] h_0_sum;
reg [7:0] h_1_sum;
reg [7:0] h_2_sum;

assign h00 = i0 * i0w0;
assign h01 = i1 * i1w0;
assign h02 = i2 * i2w0;
assign h03 = i3 * i3w0;

assign h10 = i0 * i0w1;
assign h11 = i1 * i1w1;
assign h12 = i2 * i2w1;
assign h13 = i3 * i3w1;

assign h20 = i0 * i0w2;
assign h21 = i1 * i1w2;
assign h22 = i2 * i2w2;
assign h23 = i3 * i3w2;

// Calculating Sum of SOP part
assign h_0_sum = h00 + h01 + h02 + h03 + h0b;
assign h_1_sum = h10 + h11 + h12 + h13 + h1b;
assign h_2_sum = h20 + h21 + h22 + h23 + h2b;

assign h0 = relu(h_0_sum);
assign h1 = relu(h_1_sum);
assign h2 = relu(h_2_sum);

function [7:0] relu(input [7:0] sigma);
	begin
		relu = (sigma > 0) ? sigma : 0;
	end
endfunction
endmodule