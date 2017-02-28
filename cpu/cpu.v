`include "datareg.v"
`include "alu.v"
`include "insdec.v"
`include "pc.v"
module cpu(clk_i,rst_i,p_addr,p_data,r_addr,r_data_i,r_data_o,we);
input clk_i,rst_i;
input [7:0] p_data;
input [3:0] r_data_i;
output [3:0] p_addr,r_addr,r_data_o;
output we;
wire load_a,load_b,load_rf,dsel,aluop,jmp,hlt,rst,clk;
wire [3:0] reg_in,a_out,b_out,r_in;
pc PC(.clk_i (clk),
      .rst_i (rst),
      .jump_i (jmp),
      .jump_v (p_data[3:0]),
      .count_o (p_addr) );
datareg A(.clk_i (clk),
          .rst_i (rst),
          .en_i (load_a),
          .in_i (reg_in),
          .out_o (a_out) );
datareg B(.clk_i (clk),
          .rst_i (rst),
          .en_i (load_b),
          .in_i (reg_in),
          .out_o (b_out) );
datareg R(.clk_i (clk),
          .rst_i (rst),
          .en_i (load_rf),
          .in_i (r_in),
          .out_o (r_data_o) );
alu ALU(.a (a_out),
        .b (b_out),
        .op (aluop),
        .r (r_in));
insdec DECODER(.ins (p_data[7:4]),
               .carry (1'b0),
               .zero (1'b0),
	       .aload (load_a),
               .bload (load_b),
               .dsel (dsel),
               .rfload (load_rf),
               .str (we),
               .opsel (aluop),
               .jump (jmp),
               .hlt (hlt) );
endmodule