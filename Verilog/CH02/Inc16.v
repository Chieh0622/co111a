`include "Add16.v"

module Inc16(input[0:15] in, output[0:15] out);
  Add16 g1(in, 16'h1, out);
endmodule