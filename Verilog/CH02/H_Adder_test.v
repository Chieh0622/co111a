`include "Adder.v"

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

    always #50 begin
        b++;
    end

    always #100 begin        
        a++;
    end

    initial #151 $finish;
endmodule