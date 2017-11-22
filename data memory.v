
module dataMemory(clk,address,writeData,readData,memWrite,memRead);
input clk;
input [31:0]address;
input [31:0]writeData;
input memWrite;
input memRead;
output reg [31:0]readData;
reg [31:0]Dmemory[0:1024];//modify later if needed
always@ (posedge clk)
begin
if(memWrite)
Dmemory[address]<=writeData;
else if(memRead)
readData<=Dmemory[address];

end
endmodule