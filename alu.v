`timescale 1 ns / 1 ns

module myALU (A,B,op,shift_amt,result,overflow,zeroFlag);
input wire[31:0] A,B;
input wire [3:0] op;
input wire [4:0] shift_amt;

output reg overflow;
output integer result;
output zeroFlag;

wire[31:0] B_negative;
assign B_negative = - B ; 
assign zeroFlag = (result==0)?1:0;

integer holder; //to hold difference between A and B
integer mask;

always@(A,B,op,shift_amt)
begin
if (op==0)
	begin
	result = A + B;

	if ((A[31]==B[31]) && (result[31] == ~A[31])) overflow = 1;
	else overflow = 0;
	end


else if (op==1)
	begin
	result = A - B;

	if ((A[31]==B_negative[31]) && (result[31] == ~A[31])) overflow = 1;
	else overflow = 0;
	end


else if (op==2)
	begin
	result = A & B;

	overflow = 0;
	end

else if (op==3)
	begin
	result = A | B;

	overflow = 0;
	end


else if (op==4)
	begin
	result = A<<shift_amt;

	overflow = 0;
	end


else if (op==5)
	begin
	result = A>>shift_amt;

	overflow = 0;
	end



else if (op==6)
	begin
	
	result = $signed(A)>>>shift_amt;
	//result[31] = A[31]; //bcs shift arithmaec doesn't work as expected
	//if(A[31]==1)
	//begin
	//mask = 32'h FFFFFFFF;
	//mask = mask>>shift_amt;
	//mask =~mask;
	//result = result| mask;
	//end	
	
	


	overflow = 0;
	end


else if (op==7)
	begin
	holder = A-B;
	if (holder==0)
		result = 0;
	else 
		result = {{31{1'b0}},~holder[31]};

	overflow = 0;
	end

else if (op==8)
	begin
	holder = A-B;
	if (holder==0)
		result = 0;
	else 
		result = {{31{1'b0}},holder[31]};

	overflow = 0;
	end

else begin result = 32'h xxxxxxxx; overflow = 1'b x; end

end

endmodule

















module testALU();

 integer  A,B;
 reg [3:0] op;
 reg [4:0] shift_amt;
wire overflow;	wire zeroFlag;
wire[31:0] result;

myALU new1(A,B,op,shift_amt,result,overflow,zeroFlag);



initial
begin
A = 8;
B = 7;
op=1;
shift_amt=3;
$monitor ("op: %d \nA: %b \nB: %b \nResult: %b  %d \noverflow:  %b\nzeroFlag: %b" ,op,A,B,result,$signed(result),overflow,zeroFlag);


end
endmodule