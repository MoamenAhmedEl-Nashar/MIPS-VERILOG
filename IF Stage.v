`timescale 1ns/1ns
module IF(clk,instructionAddress,instructionCode);
input clk;
input[31:0] instructionAddress;
output [31:0]instructionCode;
instructionMemory mem1(clk,instructionAddress,instructionCode);

endmodule