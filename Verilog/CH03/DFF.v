`include "../CH02/gates02.v"

module DFF (in, clk, out);
    input in, clk;
    output out;

    reg q;
    assign out = q;

    always @(posedge clk) 
    begin
        q = in;    
    end
endmodule