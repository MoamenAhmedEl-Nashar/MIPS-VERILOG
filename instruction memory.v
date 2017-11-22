module instructionMemory(clk,instructionAddress,instructionCode);
input clk;
input [31:0]instructionAddress;
output reg[31:0]instructionCode;
parameter size=1024;// size of memory (words)1kw=4kb
reg [31:0]Imemory[0:size];
//reding instructions from file

//////////////////////////////////
always @(posedge clk)
begin
instructionCode<=Imemory[instructionAddress];
end



endmodule

