//Module Multiplxer for 8 bits
module MULTIPLEXER_8BITS_4TO1 #(parameter Gnd = 0)(
    // Inputs and outputs declaration
    input [7:0] D0,
    input [7:0] D1,
    input [7:0] D2,
    input [7:0] D3,
    input [1:0] S,
    output [7:0] Y
);
    
    //Instantiate 8 multiplexers for each bit
    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX0 (
        .D({D3[0], D2[0], D1[0], D0[0]}),
        .S(S),
        .Y(Y[0])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX1 (
        .D({D3[1], D2[1], D1[1], D0[1]}),
        .S(S),
        .Y(Y[1])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX2 (
        .D({D3[2], D2[2], D1[2], D0[2]}),
        .S(S),
        .Y(Y[2])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX3 (
        .D({D3[3], D2[3], D1[3], D0[3]}),
        .S(S),
        .Y(Y[3])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX4 (
        .D({D3[4], D2[4], D1[4], D0[4]}),
        .S(S),
        .Y(Y[4])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX5 (
        .D({D3[5], D2[5], D1[5], D0[5]}),
        .S(S),
        .Y(Y[5])
    );

    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX6 (
        .D({D3[6], D2[6], D1[6], D0[6]}),
        .S(S),
        .Y(Y[6])
    );
    MULTIPLEXER_4TO1 #( .Gnd(Gnd) ) MUX7 (
        .D({D3[7], D2[7], D1[7], D0[7]}),
        .S(S),
        .Y(Y[7])
    );
endmodule