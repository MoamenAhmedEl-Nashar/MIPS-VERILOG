
`timescale 1 ns / 1 ns

module signExtend (in,out);
	input [15:0] in;
	output [31:0] out;
	
	assign out =(in[15]===0)?{16'b0,in}:{16'hFFFF,in};

endmodule	  



module signExtendTest;
	reg[15:0] in;
	wire[31:0] out;
	
	signExtend s(in,out);
	
initial
	begin
		in = 34;
		$monitor("in= %b \nout = %b = %",in,out,$signed(out));
	end
	
endmodule
