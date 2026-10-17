//Module CompMayor
module COMP_M(
    // Inputs and outputs declaration
    input AE0,BE0,AE1,BE1,AE2,BE2,AE3,BE3,AE4,BE4,I1,I2,I3,I4,
    output IS
);
    wire  C1,C2,C3,C4,C5,N1,N2,N3,N4,N5;

    //NOT declarations
    not IN1(N1,BE0);
    not IN2(N2,BE1);
    not IN3(N3,BE2);
    not IN4(N4,BE3);
    not IN5(N5,BE4);

    //AND declarations
    and AND1(C1,N5,AE4);
    and AND2(C2,N4,AE3,I1);
    and AND3(C3,N3,AE2,I2);
    and AND4(C4,N2,AE1,I3);
    and AND5(C5,N1,AE0,I4);

    //OR declarations
    or OR1(IS,C1,C2,C3,C4,C5);
endmodule