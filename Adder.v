`timescale 1 ns/1 ns
module Adder (in1,in2,out);
input[31:0] in1,in2;
output [31:0] out;
assign out = in1+in2;
endmodule	

module ShiftLeft2(in1,out);

	input [31:0] in1;
	output[31:0] out;
	
	assign out = in1<<2;
	
endmodule
