module HelloWorld;
initial 
begin
    $display("Hello World!");
    #40 $finish;
end
endmodule