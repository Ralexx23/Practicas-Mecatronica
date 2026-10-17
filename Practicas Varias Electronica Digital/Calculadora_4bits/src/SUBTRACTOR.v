//Module SUBTRACTOR 4 BITS
module SUBTRACTOR_4BITS #(parameter Bin = 1)( // We set Bin = 1 for 2's complement subtraction
    // Inputs and outputs declaration
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Bout
);
    
    //Internal wires
    wire [3:0] B_inv;
    wire SA;

    //Invert B bits
    NOT NOT_IC (
        .NE1(B[0]),
        .NE2(B[1]),
        .NE3(B[2]),
        .NE4(B[3]),

        .NS1(B_inv[0]),
        .NS2(B_inv[1]),
        .NS3(B_inv[2]),
        .NS4(B_inv[3])
    );

    //4 Bits Subtractor Declarations
    ADDER_4BITS #( .Cin(Bin) ) ADDER_IC (
        .A(A),
        .B(B_inv),

        .S(S),
        .Cout(SA)
    );

    not CN1(Bout, SA);
endmodule