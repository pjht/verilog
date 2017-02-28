module insdec(ins,carry,zero,aload,bload,dsel,rfload,str,opsel,jump,hlt);
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
		jump=0;	
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
