//Module Multiplixer 4:1
module MULTIPLEXER_4TO1 #(parameter Gnd = 0)(
    // Inputs and outputs declaration
    input [3:0] D,
    input [1:0] S,
    output Y
);
    
    //Internal wires
    wire w0, w1, w2, w3, w4, w5, w6, w7;

    //Not gates for select lines
    NOT N1 (
        .NE1(S[0]),
        .NS1(w0)
    );

    NOT N2 (
        .NE1(S[1]),
        .NS1(w1)
    );

    //AND gates for data lines and select lines
    and A1 (w2, D[0], w1, w0);
    and A2 (w3, D[1], w1, S[0]);
    and A3 (w4, D[2], S[1], w0);
    and A4 (w5, Gnd, S[1], S[0]);

    //OR gate to combine the outputs
    or O1 (Y, w2, w3, w4, w5);
endmodule