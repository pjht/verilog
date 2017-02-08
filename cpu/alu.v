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
module alu_tb();
reg [3:0] a,b;
reg op;
wire [3:0] r;
alu tb_alu(.a (a),
.b (b),
.op (op),
.r (r)
);
initial begin
$monitor("a=%h,b=%h,op=%h,r=%h",
		  	a,
		  	b,
		  	op,
		  	r);
#1 a=2;b=2;op=0;
#1 a=3;b=2;op=1;
end
endmodule
