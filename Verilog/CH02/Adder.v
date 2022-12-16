`include "./CH01/DMux.v"

module HalfAdder (a, b, sum, carry);
    input a, b;
    output sum, carry;

    Xor g0(a, b, sum);
    And g1(a, b, carry);
endmodule

module FullAdder (a, b, c, sum, carry);
    input a, b, c;
    output sum, carry;
    wire xab, and1, and2;

    Xor g0(a, b, xab);
    Xor g1(xab, c, sum);

    And g2(c, xab, and1);
    And g3(a, b, and2);

    Or  g4(and1, and2, carry);
endmodule