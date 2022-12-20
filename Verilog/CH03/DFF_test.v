`include "DFF.v"

module main;
reg in,clk;
wire out ;

DFF g1(in,clk,out);

initial begin
    clock = 0;
    in = 0;
    $monitor("in = %b,clock = %b, out = %b", in,clk, out);
  end
  always #1 begin
  clk = ~clk;
  end
  always #2 begin
  in = in + 1;
  end

initial #10 $finish(0);

endmodule