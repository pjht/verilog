module ins_dec(ins,carry,zero,aload,bload,dsel,rfload,str,opsel,jump,hlt);
input [3:0] ins;
input carry,zero;
output aload,bload,dsel,rfload,str,opsel,jump,hlt;
wire ins;
reg aload,bload,dsel,rfload,opsel,str,jump,hlt;
always @(*)
	if (ins==0) begin
		aload=1;
		bload=0;
		dsel=0;
		rfload=0;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;
	end else if (ins==1) begin
		aload=0;
		bload=1;
		dsel=0;
		rfload=0;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;
	end else if (ins==2) begin
		aload=1;
		bload=0;
		dsel=1;
		rfload=0;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;
	end else if (ins==3) begin
		aload=0;
		bload=1;
		dsel=1;
		rfload=0;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;		
	end else if (ins==4) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=1;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;
	end else if (ins==5) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=1;
		str=0;
		opsel=1;
		jump=0;
		hlt=0;
	end else if (ins==6) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
		hlt=0;
	end else if (ins==7) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
		hlt=0;
	end else if (ins==8 && carry) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
		hlt=0;
  end else if (ins==9 && !carry) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
	end else if (ins==10 && zero) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
		hlt=0;
	end else if (ins==11 && !zero) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;
		hlt=0;
	end else if (ins==12) begin
		aload=0;
		bload=0;
		dsel=0;
		rfload=0;
		str=1;
		opsel=0;
		jump=1;	
		hlt=1;	
	end else begin
		bload=0;
		dsel=0;
		aload=0;
		rfload=0;
		str=0;
		opsel=0;
		jump=0;
		hlt=0;	
	end
endmodule
module insdec_tb();
reg [3:0] ins;
reg carry, zero;
wire aload,bload,dsel,rfload,opsel,jump,hlt;
ins_dec insdec(.ins (ins),
.carry (carry),
.zero (zero),
.aload (aload),
.bload (bload),
.dsel (dsel),
.rfload (rfload),
.opsel (opsel),
.jump (jump),
.hlt (hlt)
);
initial begin
$monitor("ins=%h,carry=%b,zero=%b,aload=%b,bload=%b,dsel=%b,rfload=%b,opsel=%b,jump=%b,hlt=%b",
		  	ins,
		  	carry,
		  	zero,
			aload,
			bload,
			dsel,
			rfload,
			opsel,
			jump,
			hlt);
ins=0;
carry=0;
zero=0;
#1 ins=1;
#1 ins=2;
#1 ins=3;
#1 ins=4;
#1 ins=5;
#1 ins=6;
#1 ins=7;
#1 ins=8;carry=1;
#1 ins=8;carry=0;
#1 ins=9;carry=1;
#1 ins=9;carry=0;
#1 ins=10;zero=1;
#1 ins=10;zero=0;
#1 ins=11;zero=1;
#1 ins=11;zero=0;
#1 ins=12;
end
endmodule
