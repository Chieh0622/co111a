`include "Adder.v"

module main;
    reg a,b,c;
    wire sum,carry,sum1,carry1;

    HalfAdder g0(a,b,sum,carry);
    FullAdder g1(a,b,c,sum1,carry1);

    initial 
    begin
        $monitor("%4dns a =%b b =%b c =%b sum =%b carry =%b sum1 =%b carry1 =%b",$stime,a,b,c,sum,carry,sum1,carry1);
        a = 0;
        b = 0;
        c = 0;
    end

    always #50 begin
        a = a + 1;
    end

    always #100 begin
        b = b + 1;
    end

    always #150 begin
        c = c + 1;
    end

    initial #201 $finish;
endmodule