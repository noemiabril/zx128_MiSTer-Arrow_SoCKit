//-------------------------------------------------------------------------------------------------
module audio
//-------------------------------------------------------------------------------------------------
(
	input  wire       speaker,
	input  wire       mic,
	input  wire       ear,

	input  wire[ 7:0] spd,

	input  wire[ 7:0] a1,
	input  wire[ 7:0] b1,
	input  wire[ 7:0] c1,
	input  wire[ 7:0] a2,
	input  wire[ 7:0] b2,
	input  wire[ 7:0] c2,

	input  wire[ 7:0] saaL,
	input  wire[ 7:0] saaR,

	output wire[11:0] left,
	output wire[11:0] right
);
//-------------------------------------------------------------------------------------------------

reg[7:0] ula;
always @(*) case({ speaker, ear, mic })
	0: ula <= 8'h00;
	1: ula <= 8'h24;
	2: ula <= 8'h40;
	3: ula <= 8'h64;
	4: ula <= 8'hB8;
	5: ula <= 8'hC0;
	6: ula <= 8'hF8;
	7: ula <= 8'hFF;
endcase

//-------------------------------------------------------------------------------------------------

assign left  = { 4'd0, ula }+{ 2'd0, spd, 2'd0 }+{ 3'd0, a1, 1'd0 }+{ 3'd0, a2, 1'd0 }+{ 4'd0, b1 }+{ 4'd0, b2 }+{ 3'd0, saaL, 1'd0 };
assign right = { 4'd0, ula }+{ 2'd0, spd, 2'd0 }+{ 3'd0, c1, 1'd0 }+{ 3'd0, c2, 1'd0 }+{ 4'd0, b1 }+{ 4'd0, b2 }+{ 3'd0, saaR, 1'd0 };

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
