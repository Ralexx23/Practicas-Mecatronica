//Module ADDER 4 BITS
module ADDER_4BITS #(parameter Cin = 0)(
    // Inputs and outputs declaration
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Cout
);
    
    //Internal wires
    wire C1,C2,C3;

    //4 Bits Adder Declarations
    FULL_ADDER FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),

        .S(S[0]),
        .Cout(C1)
    );

    FULL_ADDER FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),

        .S(S[1]),
        .Cout(C2)
    );

    FULL_ADDER FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C2),

        .S(S[2]),
        .Cout(C3)
    );

    FULL_ADDER FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C3),

        .S(S[3]),
        .Cout(Cout)
    );
endmodule