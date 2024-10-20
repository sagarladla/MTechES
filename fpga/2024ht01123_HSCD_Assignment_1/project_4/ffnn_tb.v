module ffnn_tb;
// input layer
reg [7:0] h0;
reg [7:0] h1;
reg [7:0] h2;

// out_0 weights
reg [7:0] h0w0;
reg [7:0] h1w0;
reg [7:0] h2w0;

// out_1 weights
reg [7:0] h0w1;
reg [7:0] h1w1;
reg [7:0] h2w1;

// out_0 bias
reg [7:0] out_0b;
// out_1 bias
reg [7:0] out_1b;

// output layer
wire [7:0] out_0;
wire [7:0] out_;

initial begin
	// hidden input neurons
	h0 = 0;
    h1 = 11;
    h2 = 10;
	
	// weights
	h0w0 = -1;
	h1w0 = 2;
	h2w0 = 1;
	
	h0w1 = 2;
	h1w1 = 1;
	h2w1 = 3;
	
	// output neurons biases
	out_0b = 1;
	out_1b = -1;
	
end
ffnn UUT
(
	.h0(h0),
    .h1(h1),
    .h2(h2),
	
    .h0w0(h0w0),
    .h1w0(h1w0),
    .h2w0(h2w0),
    
	.h0w1(h0w1),
    .h1w1(h1w1),
    .h2w1(h2w1),
    
	.out_0b(out_0b),
    .out_1b(out_1b),
    
	.out_0(out_0),
    .out_1(out_1)
);
endmodule