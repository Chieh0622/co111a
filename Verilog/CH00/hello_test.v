module HelloVerilog;

initial begin
    $display("Hello World!");
    #40 $finish;
end

endmodule