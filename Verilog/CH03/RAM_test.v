`include "RAM.v"

module main;
    reg [15:0] in;
    reg clk, load;
    reg [13:0] address;
    wire [15:0] out;

    RAM16K m(in, clk, load, address, out);

    initial 
    begin
        clk = 0;
        $monitor("%4dns in=%d clock=%d load=%d address=%d out=%d", $stime, in, clk, load, address, out);
        #10 in = 3; load = 1; address = 5;
        #10 load = 0;
        #10 $finish(0);
    end

    always #2
    begin
        clk = clk + 1;    
    end
endmodule