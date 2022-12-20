`include "HF_Adder.v"

module main;
    reg a, b, c;
    wire sum, carry;

    FullAdder g0(a, b, c, sum, carry);

    initial 
    begin
        $display("  Time | a | b | c | sum |carry");
        $monitor("%4dns | %b | %b | %b | %2b  | %2b", $stime, a, b, c, sum, carry);
        a = 0;
        b = 0;
        c = 0;
    end

    always #50 
    begin
        c++;    
    end

    always #100 
    begin     
        b++;   
        
    end

    always #200
    begin
        a++;
    end


    initial #350 $finish(0);
endmodule