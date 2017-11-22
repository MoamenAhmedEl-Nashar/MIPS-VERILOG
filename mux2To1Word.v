
`timescale 1 ns / 1 ns
module mux2to1(in1,in2,sel,out);
input[31:0] in1,in2;
input sel;
output[31:0]  out;

assign out = (sel==0)? in1 : 
(sel==1)? in2 :
 32'bx;

endmodule


















module testMux2to1();
reg[31:0] in1,in2;
reg sel;
wire[31:0] out;
mux2to1 newMux(in1,in2,sel,out);

initial
begin
in1=35;
in2 = 67;

sel = 0;

$monitor("%d %d %d %d\n",in1,in2,sel,out);

#5
sel = 1;


end


endmodule