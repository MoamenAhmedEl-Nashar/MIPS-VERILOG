--
`timescale 1 ns / 1 ns

module ControlUnit(opCode,RegDst,BranchEq,BranchNeq,RegWrite,ALUsrc,MemWrite,MemToReg,jump,ALUop);
	output reg RegDst,BranchEq,BranchNeq,RegWrite,ALUsrc,MemWrite,MemToReg,jump;
	input [5:0] opCode;
	output reg[2:0] ALUop; 
	
	
	
	
	
	parameter R = 6'b000000,addi= 6'b001000,andi = 6'b001100,ori = 6'b001101,slti = 6'b001010
	,beq = 6'b000100, bneq= 6'b000101, j = 6'b000010, jal= 6'b000011,lw = 6'b100011,sw = 6'b101011
	,rALUcontrol = 3'b000,addALUcontrol = 3'b001,subALUcontrol = 3'b010,andALUcontrol =3'b011,orALUcontrol = 3'b 100, sltALUcontrol = 3'b101;
	
	always@(opCode)
		begin 
			
		if(opCode==R)
			begin
				RegDst = 1;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 0;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = rALUcontrol;
				jump =0;
			end	  
			
		else if(opCode==addi)
			begin
				RegDst = 0;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 1;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = addALUcontrol;
				jump =0;
			end	 
			
			
			else if(opCode==ori)
			begin
				RegDst = 0;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 1;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = orALUcontrol;
				jump =0;
			end	 
			
			
			
			else if(opCode==andi)
			begin
				RegDst = 0;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 1;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = andALUcontrol;
				jump =0;
			end	 
			
			
			else if(opCode==slti)
			begin
				RegDst = 0;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 1;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = sltALUcontrol;
				jump =0;
			end	 
			
			
			
		else if(opCode==beq)
			begin
				RegDst = 1'bx;
				BranchEq = 1;
				BranchNeq = 0;
				RegWrite = 0;
				ALUsrc = 0;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = subALUcontrol;
				jump =0;
			end	  
			
		else if(opCode==bneq)
			begin
				RegDst = 1'bx;
				BranchEq = 0;
				BranchNeq = 1;
				RegWrite = 0;
				ALUsrc = 0;
				MemWrite = 0;
				MemToReg = 0;
				ALUop = subALUcontrol;
				jump =0;
			end
			
			 else if(opCode==lw)
			begin
				RegDst = 0;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 1;
				ALUsrc = 1;
				MemWrite = 0;
				MemToReg = 1;
				ALUop = addALUcontrol;
				jump =0;
			end		 
			
			
			 else if(opCode==sw)
			begin
				RegDst = 1'bx;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 0;
				ALUsrc = 1;
				MemWrite = 1;
				MemToReg = 1'bx;
				ALUop = addALUcontrol;
				jump =0;
			end		  
			
			
			else if(opCode==j)
			begin
				RegDst = 1'bx;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 0;
				ALUsrc = 1'bx;
				MemWrite = 0;
				MemToReg = 1'bx;
				ALUop = 3'bxxx;
				jump =1;
			end		 
			
			else 
			begin
				RegDst = 1'bx;
				BranchEq = 0;
				BranchNeq = 0;
				RegWrite = 0;
				ALUsrc = 1'bx;
				MemWrite = 0;
				MemToReg = 1'bx;
				ALUop = 3'bxxx;
				jump =1;
			end
			
		end
	

endmodule
