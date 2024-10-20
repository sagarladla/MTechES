module in_to_hidden(
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
// for hidden neuron 0
wire [15:0] h00;
wire [15:0] h01;
wire [15:0] h02;
wire [15:0] h03;
// for hidden neuron 1
wire [15:0] h10;
wire [15:0] h11;
wire [15:0] h12;
wire [15:0] h13;
// for hidden neuron 2
wire [15:0] h20;
wire [15:0] h21;
wire [15:0] h22;
wire [15:0] h23;

// for SOP result
wire [11:0] h_0_sum;
wire [11:0] h_1_sum;
wire [11:0] h_2_sum;

// Calculating Products of SOP part
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
assign h_0_sum = h00[15:8] + h01[15:8] + h02[15:8] + h03[15:8] + h0b;
assign h_1_sum = h10[15:8] + h11[15:8] + h12[15:8] + h13[15:8] + h1b;
assign h_2_sum = h20[15:8] + h21[15:8] + h22[15:8] + h23[15:8] + h2b;

// passing SOP to ReLU activation function
assign h0 = relu(h_0_sum[11:4]);
assign h1 = relu(h_1_sum[11:4]);
assign h2 = relu(h_2_sum[11:4]);

// ReLU activation function
function [7:0] relu(input [7:0] sigma);
	begin
		//if (sigma > '0) begin
		//	assign relu = sigma;
		//end
		//else begin
		//	assign relu = 8b'00000000;
		//end
		assign relu = (sigma > '0) ? sigma : 0;
	end
endfunction
endmodule
