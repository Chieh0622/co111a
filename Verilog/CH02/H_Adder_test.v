`include "HF_Adder.v"

module main;
    reg a, b;
    wire sum, carry;

    HalfAdder g0(a, b, sum, carry);

    initial 
    begin
        $display("  Time | a | b | sum |carry");
        $monitor("%4dns | %b | %b | %2b  | %2b", $stime, a, b, sum, carry);
        a = 0;
        b = 0;
    end

    always #50 
    begin
        b = b + 1;
    end

    always #100 
    begin        
        a = a + 1;
    end

    initial #150 $finish(0);
endmodule