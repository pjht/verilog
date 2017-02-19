// Program Counter for CPU1
// Original design by Charlie Krauter for KT8
// 4 bit counter with reset. Can also jump.

module pc(clk_i,
          rst_i,
          jump_i,
          jump_v,
          count_o );
  input clk_i, rst_i, jump_i;
  input [3:0] jump_v;
  output [3:0] count_o;
  reg [3:0] count_o;
					   
  always @(posedge clk_i, posedge rst_i)
    if (rst_i) count_o<=0;
    else if (jump_i) count_o<=jump_i;
    else count_o<=count_o+1;

endmodule


