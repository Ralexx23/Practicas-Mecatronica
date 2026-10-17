//Module ComIgualdad
module COM_I(
    // Inputs and outputs declaration
    input AE0,BE0,AE1,BE1,AE2,BE2,AE3,BE3,AE4,BE4,
    output IS
);
    
    wire  C1,C2,C3,C4,C5;

    //XNOR declarations
    xnor XNO1(C1,AE0,BE0);
    xnor XNO2(C2,AE1,BE1);
    xnor XNO3(C3,AE2,BE2);
    xnor XNO4(C4,AE3,BE3);
    xnor XNO5(C5,AE4,BE4);

    //AND declarations
    and AND1(IS,C1,C2,C3,C4,C5);
endmodule