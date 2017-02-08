// Data Register for CPU1. Used for A,B,and R
// Original 8 bit design by Charlie Krauter for KT8.
// 4 bit register with reset and enable

module datareg(clk_i,
               rst_i,
               en_i,
               in_i,
               out_o );
  input clk_i, rst_i, en_i;
  input [3:0] in_i;
  output [3:0] out_o;

  reg [3:0] out_o;
					   
  always @(posedge clk_i, posedge rst_i)
    if (rst_i) out_o<=0;
    else if (en_i) out_o<=in_i;

endmodule
