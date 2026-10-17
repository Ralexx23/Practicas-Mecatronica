//Module Main Calculator
module CALCULADORA(
    // Inputs and outputs declaration
    input [4:0] A,
    input [4:0] B,
    input [1:0] Sel,
    output [7:0] Y
);
    
    //Internal wires
    wire [7:0] Sum, Sub, Mul;
    wire [3:0] Comp, Comp1;

    //Instantiate Adder
    ADDER_4BITS ADDER_IC (
        .A(A[3:0]),
        .B(B[3:0]),

        .S(Sum[3:0]),
        .Cout(Sum[4])
    );

    //Instantiate Subtractor
    SUBTRACTOR_4BITS SUBTRACTOR_IC (
        .A(A[3:0]),
        .B(B[3:0]),

        .S(Sub[3:0]),
        .Bout(Sub[4])
    );

    //Instantiate Multiplier
    MULTIPLIER_4BITS MULTIPLIER_IC (
        .A(A[3:0]),
        .B(B[3:0]),

        .P(Mul)
    );
    
    COM_I IG (
        .AE0(A[0]),
        .AE1(A[1]),
        .AE2(A[2]),
        .AE3(A[3]),
        .AE4(A[4]),
        .BE0(B[0]),
        .BE1(B[1]),
        .BE2(B[2]),
        .BE3(B[3]),
        .BE4(B[4]),

        .IS(Comp[0])
    );

    CHECK_E CE (
        .AE1(A[1]),
        .AE2(A[2]),
        .AE3(A[3]),
        .AE4(A[4]),
        .BE1(B[1]),
        .BE2(B[2]),
        .BE3(B[3]),
        .BE4(B[4]),

        .IS1(Comp1[0]),
        .IS2(Comp1[1]),
        .IS3(Comp1[2]),
        .IS4(Comp1[3])
    );

    COMP_M CM (
        .AE0(A[0]),
        .AE1(A[1]),
        .AE2(A[2]),
        .AE3(A[3]),
        .AE4(A[4]),
        .BE0(B[0]),
        .BE1(B[1]),
        .BE2(B[2]),
        .BE3(B[3]),
        .BE4(B[4]),
        .I1(Comp1[0]),
        .I2(Comp1[1]),
        .I3(Comp1[2]),
        .I4(Comp1[3]),

        .IS(Comp[1])
    );

    COMP_M CN (
        .AE0(B[0]),
        .AE1(B[1]),
        .AE2(B[2]),
        .AE3(B[3]),
        .AE4(B[4]),
        .BE0(A[0]),
        .BE1(A[1]),
        .BE2(A[2]),
        .BE3(A[3]),
        .BE4(A[4]),
        .I1(Comp1[0]),
        .I2(Comp1[1]),
        .I3(Comp1[2]),
        .I4(Comp1[3]),

        .IS(Comp[2])
    );

    //Instantiate 8 bits Multiplexer
    MULTIPLEXER_8BITS_4TO1 #( .Gnd(0) ) MUX_IC (
        .D0(Sum),
        .D1(Sub),
        .D2(Mul),
        .D3(Comp),
        .S(Sel),
        .Y(Y)
    );
endmodule


