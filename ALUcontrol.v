
module ALUcontrol (operation,func,ALU);
	input[2:0] operation;
	input[5:0] func;
	output reg[3:0] ALU;
	
	parameter ADD = 0, SUB = 1, AND = 2, OR = 3, SLL = 4, SRL = 5, SRA = 6, BIGGER = 7, LESS = 8
	,rALUcontrol = 3'b000,addALUcontrol = 3'b001,subALUcontrol = 3'b010,andALUcontrol =3'b011,orALUcontrol = 3'b 100, sltALUcontrol = 3'b101;   
	
	always@(operation or func)
		begin
		  	case(operation)
				  
				  rALUcontrol:
				  case(func)
					  6'b100000: ALU = ADD;
					  6'b100010: ALU = SUB;
					  6'b100100: ALU = AND;
					  6'b100101: ALU = OR;
					  6'b000000: ALU = SLL;
					  6'b000010: ALU = SRL;
					  6'b000011: ALU = SRA;
					  6'b101010: ALU = LESS;
					  default: ALU = SLL;

				  endcase
					  
				  addALUcontrol:
				  ALU = ADD;
				  
				  subALUcontrol:
				  ALU = SUB;
				  
				  andALUcontrol:
				  ALU = AND; 
				  
				  orALUcontrol:
				  ALU = OR;	  
				  
				  sltALUcontrol:
				  ALU = LESS;
				  
				  
				  default:
				  ALU = SLL;
				  
			endcase
			
		end

endmodule
