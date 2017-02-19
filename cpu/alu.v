module alu(a,b,op,r);
input [3:0] a,b;
input op;
output [3:0] r;
wire a,b,op;
reg r;
always @(*)
	if (op==0) begin
		r=a+b;
	end else begin
		r=a-b;
	end
endmodule