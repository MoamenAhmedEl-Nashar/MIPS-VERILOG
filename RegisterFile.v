`timescale 1 ns / 1 ns

module RegisterFile(rr1,rr2,wr,writeData,readData1,readData2,Clk,writeEN);

integer registers [0:31];

input wire[4:0] rr1,rr2,wr;
input wire Clk;
input wire [31:0] writeData;
output wire [31:0] readData1,readData2;
input wire writeEN;

assign readData1 = registers [rr1];
assign readData2 = registers [rr2];





always@(negedge Clk)
begin
if(writeEN==1)
registers [wr] = writeData;

end


endmodule













   `timescale 1 ns/1 ns
module testRegisterFile();
reg[4:0] rr1,rr2,wr;
reg Clk,writeEN;
integer  writeData;
wire [31:0] readData1,readData2;
RegisterFile regss(rr1,rr2,wr,writeData,readData1,readData2,Clk,writeEN);

initial
begin
Clk =0;
rr1 = 5'h 3;
rr2 = 5'h 5;
$monitor ($time ,, "%d %d %d   EN: %d", Clk, readData1,rr1,writeEN);
writeEN = 0;
writeData = - 344;
wr = 3;

#7
writeEN = 1;


end

always
begin
#5
Clk= ~Clk;
end
endmodule