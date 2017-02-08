module ins_dec(ins,aload,bload,dsel,rload,opsel,jump);
input [3:0] ins;
output aload,bload,dsel,rload,opsel,jump;
wire ins;
reg aload,bload,dsel,rload,opsel,jump;
always @(*)
	if (ins==0) begin
		aload=1;
		bload=0;
		dsel=0;
		rload=0;
		opsel=0;
		jump=0;
	end else if (ins==1) begin
		bload=1;
		aload=0;
		dsel=0;
		rload=0;
		opsel=0;
		jump=0;
	end else if (ins==2) begin
		aload=1;
		dsel=1;
		bload=0;
		rload=0;
		opsel=0;
		jump=0;
	end else if (ins==3) begin
		bload=1;
		dsel=1;
		aload=0;
		rload=0;
		opsel=0;
		jump=0;		
	end else begin
		bload=0;
		dsel=0;
		aload=0;
		rload=0;
		opsel=0;
		jump=0;	
	end
endmodule
module insdec_tb();
reg [3:0] ins;
wire aload,bload,dsel,rload,opsel,jump;
ins_dec insdec(.ins (ins),
.aload (aload),
.bload (bload),
.dsel (dsel),
.rload (rload),
.opsel (opsel),
.jump (jump)
);
initial begin
$monitor("ins=%h,aload=%b,bload=%b,dsel=%b,rload=%b,opsel=%b,jump=%b",
		  	ins,
			aload,
			bload,
			dsel,
			rload,
			opsel,
			jump);
ins=0;
#1 ins=1;
#1 ins=2;
#1 ins=3;
end
endmodule
