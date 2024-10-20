module ffnn_tb;
// input layer
reg [7:0] i0;
reg [7:0] i1;
reg [7:0] i2;
reg [7:0] i3;

// h0 weights
reg [7:0] i0w0;
reg [7:0] i1w0;
reg [7:0] i2w0;
reg [7:0] i3w0;

// h1 weights
reg [7:0] i0w1;
reg [7:0] i1w1;
reg [7:0] i2w1;
reg [7:0] i3w1;

// h2 weights
reg [7:0] i0w2;
reg [7:0] i1w2;
reg [7:0] i2w2;
reg [7:0] i3w2;

// h0 bias
reg [7:0] h0b;
// h1 bias
reg [7:0] h1b;
// h2 bias
reg [7:0] h2b;

// hidden layer
wire [7:0] h0;
wire [7:0] h1;
wire [7:0] h2;

initial begin
	// input neurons
	i0 = 1;
    i1 = 3;
    i2 = -2;
    i3 = 3;
	
	// input weights
    i0w0 = 1;
    i1w0 = 1;
    i2w0 = 1;
    i3w0 = -1;
    i0w1 = 2;
    i1w1 = 2;
    i2w1 = 2;
    i3w1 = 2;
    i0w2 = -3;
    i1w2 = 3;
    i2w2 = 3;
    i3w2 = 3;
    
	// hidden neurons biases
    h0b = 1;
    h1b = 1;
    h2b = 1;
end
ffnn UUT
(
	.i0(i0),
	.i1(i1),
	.i2(i2),
	.i3(i3),

	// h0 weights
	.i0w0(i0w0),
	.i1w0(i1w0),
	.i2w0(i2w0),
	.i3w0(i3w0),

	// h1 weights
	.i0w1(i0w1),
	.i1w1(i1w1),
	.i2w1(i2w1),
	.i3w1(i3w1),

	// h2 weights
	.i0w2(i0w2),
	.i1w2(i1w2),
	.i2w2(i2w2),
	.i3w2(i3w2),

	// h0 bias
	.h0b(h0b),
	// h1 bias
	.h1b(h1b),
	// h2 bias
	.h2b(h2b),

	// hidden layer
	.h0(h0),
	.h1(h1),
	.h2(h2)
);
endmodule