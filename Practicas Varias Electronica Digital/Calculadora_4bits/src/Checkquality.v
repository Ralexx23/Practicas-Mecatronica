module CHECK_E(
    // Inputs and outputs declaration
    input AE1,BE1,AE2,BE2,AE3,BE3,AE4,BE4,
    output IS1,IS2,IS3,IS4
);
    wire  C1,C2,C3,C4,C5,C6,C7,C8,C9;

    //XNOR declarations
    xnor XNO1(C1,AE1,BE1);
    xnor XNO2(C2,AE2,BE2);
    xnor XNO3(C3,AE3,BE3);
    xnor XNO4(C4,AE4,BE4);

    xnor XNO5(C5,AE2,BE2);
    xnor XNO6(C6,AE3,BE3);
    xnor XNO7(C7,AE4,BE4);

    xnor XNO8(C8,AE3,BE3);
    xnor XNO9(C9,AE4,BE4);

    xnor XNO10(IS4,AE4,BE4);

    //AND declarations
    and AND1(IS1,C1,C2,C3,C4);
    and AND2(IS2,C5,C6,C7);
    and AND3(IS3,C8,C9);
endmodule