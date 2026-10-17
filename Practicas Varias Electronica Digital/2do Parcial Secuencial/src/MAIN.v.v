//Module INPUTS_FF_D3
module INPUTS_FF_D3(
    // Inputs and outputs declaration
    input A,B,C,D,E,
    output D3
);
   
    wire  NA,NB,NC,ND,NE,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    not N5(NE,E);
    and AND1(A1,B,D);
    and AND2(A2,B,NE);
    and AND3(A3,NC,E);
    and AND4(A4,B,C);
    and AND5(A5,D,E);
    and AND6(A6,ND,NE);
    and AND7(A7,NA,A2);
    and AND8(A8,B,A3);
    and AND9(A9,A,A4);
    and AND10(A10,C,A5);
    and AND11(A11,NC,A6);
    and AND12(A12,NA,A10);
    and AND13(A13,NB,A11);
    and AND14(A14,A,A13);
    or OR1(O1,A1,A7);
    or OR2(O2,O1,A8);
    or OR3(O3,O2,A9);
    or OR4(O4,O3,A12);
    or OR5(D3,O4,A14);
endmodule


//Module INPUTS_FF_D2
module INPUTS_FF_D2(
    // Inputs and outputs declaration
    input A,B,C,D,E,
    output D2
);
   
    wire  NA,NB,NC,ND,NE,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    not N5(NE,E);
    and AND1(A1,C,NE);
    and AND2(A2,C,E);
    and AND3(A3,C,D);
    and AND4(A4,ND,NE);
    and AND5(A5,D,E);
    and AND6(A6,ND,E);
    and AND7(A7,NA,A1);
    and AND8(A8,A,A2);
    and AND9(A9,A,A3);
    and AND10(A10,NC,A4);
    and AND11(A11,NC,A5);
    and AND12(A12,C,A6);
    and AND13(A13,A,A10);
    and AND14(A14,NA,A11);
    and AND15(A15,NB,A12);
    or OR1(O1,A7,A8);
    or OR2(O2,O1,A9);
    or OR3(O3,O2,A13);
    or OR4(O4,O3,A14);
    or OR5(D2,O4,A15);
endmodule

//Module INPUTS_FF_D1
module INPUTS_FF_D1(
    // Inputs and outputs declaration
    input A,B,C,D,E,
    output D1
);
   
    wire  NA,NB,NC,ND,NE,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    not N5(NE,E);
    and AND1(A1,D,NE);
    and AND2(A2,D,E);
    and AND3(A3,ND,E);
    and AND4(A4,ND,E);
    and AND5(A5,ND,NE);
    and AND6(A6,ND,NE);
    and AND7(A7,NA,A1);
    and AND8(A8,A,A2);
    and AND9(A9,NB,A3);
    and AND10(A10,NC,A4);
    and AND11(A11,C,A5);
    and AND12(A12,B,A6);
    and AND13(A13,NA,A9);
    and AND14(A14,NA,A10);
    and AND15(A15,A,A11);
    and AND16(A16,A,A12);
    or OR1(O1,A7,A8);
    or OR2(O2,O1,A13);
    or OR3(O3,O2,A14);
    or OR4(O4,O3,A15);
    or OR5(D1,O4,A16);
endmodule

//Module INPUTS_FF_D0
module INPUTS_FF_D0(
    // Inputs and outputs declaration
    input E,
    output D0
);
   
    //declarations
    not N5(D0,E);
endmodule

//Module FF_D
module FF_D(
    // Inputs and outputs declaration
    input D,CLK,
    output reg Q
);
    always @(posedge CLK)
    begin
        Q <= D;
    end
endmodule

/*
// Flip Flop tipo D con RESET asíncrono
module FF_D(
    input D, CLK, RESET,
    output reg Q
);
    always @(posedge CLK or posedge RESET)
    begin
        if (RESET)
            Q <= 1'b0; // cuando RESET = 1, salida a 0
        else
            Q <= D;    // comportamiento normal
    end
endmodule

*/

// Module FF_T
module FF_T(
    input T, CLK,
    output reg Q
);
    always @(posedge CLK)
    begin
        if (T)
            Q <= ~Q; // Cambia el estado si T = 1
        else
            Q <= Q;  // Mantiene el estado si T = 0
    end
endmodule

module CLOCK_DIVIDER(
    input clock_in, // input clock on FPGA
    output reg clock_out // output clock after dividing the input clock by divisor
);
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd12_500_000;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in)
begin
    counter <= counter + 28'd1;
    if(counter>=(DIVISOR-1))
     counter <= 28'd0;
    clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
end
endmodule

//Module DECODER_Da
module DECODER_Da(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Da
);

    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NA,C);
    and AND2(A2,NB,D);
    and AND3(A3,NC,ND);
    and AND4(A4,NC,ND);
    and AND5(A5,C,D);
    and AND6(A6,B,NC);
    and AND7(A7,NA,A2);
    and AND8(A8,B,A3);
    and AND9(A9,A,A4);
    and AND10(A10,NB,A5);
    and AND11(A11,A,A6);
    or OR1(O1,A1,A7);
    or OR2(O2,O1,A8);
    or OR3(O3,O2,A9);
    or OR4(O4,O3,A10);
    or OR5(Da,O4,A11);
endmodule

//Module DECODER_Db
module DECODER_Db(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Db
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NC,D);
    and AND2(A2,NB,NC);
    and AND3(A3,B,C);
    and AND4(A4,C,ND);
    and AND5(A5,NB,D);
    and AND6(A6,NC,D);
    and AND7(A7,NB,A1);
    and AND8(A8,A,A2);
    and AND9(A9,NA,A3);
    and AND10(A10,B,A4);
    and AND11(A11,A,A5);
    and AND12(A12,A,A6);
    or OR1(O1,A7,A8);
    or OR2(O2,O1,A9);
    or OR3(O3,O2,A10);
    or OR4(O4,O3,A11);
    or OR5(Db,O4,A12);
endmodule

//Module DECODER_Dc
module DECODER_Dc(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Dc
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NB,D);
    and AND2(A2,NC,ND);
    and AND3(A3,C,D);
    and AND4(A4,B,NC);
    and AND5(A5,B,ND);
    and AND6(A6,B,A2);
    and AND7(A7,NA,A3);
    and AND8(A8,A,A4);
    and AND9(A9,A,A5);
    or OR1(O1,A1,A6);
    or OR2(O2,O1,A7);
    or OR3(O3,O2,A8);
    or OR4(Dc,O3,A9);
endmodule

//Module DECODER_Dd
module DECODER_Dd(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Dd
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NC,ND);
    and AND2(A2,NC,ND);
    and AND3(A3,C,D);
    and AND4(A4,B,C);
    and AND5(A5,B,NC);
    and AND6(A6,B,A1);
    and AND7(A7,A,A2);
    and AND8(A8,NB,A3);
    and AND9(A9,NA,A4);
    and AND10(A10,A,A5);
    or OR1(O1,A6,A7);
    or OR2(O2,O1,A8);
    or OR3(O3,O2,A9);
    or OR4(Dd,O3,A10);
endmodule

//Module DECODER_De
module DECODER_De(
    // Inputs and outputs declaration
    input A,B,C,D,
    output De
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,C,ND);
    and AND2(A2,NC,ND);
    and AND3(A3,B,C);
    and AND4(A4,B,NC);
    and AND5(A5,NC,D);
    and AND6(A6,C,D);
    and AND7(A7,NA,A1);
    and AND8(A8,A,A2);
    and AND9(A9,NA,A3);
    and AND10(A10,A,A4);
    and AND11(A11,NB,A5);
    and AND12(A12,NB,A6);
    and AND13(A13,NA,A11);
    and AND14(A14,A,A12);
    or OR1(O1,A7,A8);
    or OR2(O2,O1,A9);
    or OR3(O3,O2,A10);
    or OR4(O4,O3,A13);
    or OR5(De,O4,A14);
endmodule

//Module DECODER_Df
module DECODER_Df(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Df
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NB,D);
    and AND2(A2,NB,C);
    and AND3(A3,NC,ND);
    and AND4(A4,C,D);
    and AND5(A5,B,NC);
    and AND6(A6,B,ND);
    and AND7(A7,NA,A2);
    and AND8(A8,B,A3);
    and AND9(A9,NA,A4);
    and AND10(A10,A,A5);
    and AND11(A11,A,A6);
    or OR1(O1,A1,A7);
    or OR2(O2,O1,A8);
    or OR3(O3,O2,A9);
    or OR4(O4,O3,A10);
    or OR5(Df,O4,A11);
endmodule

//Module DECODER_Dg
module DECODER_Dg(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Dg
);
   
    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,NC,D);
    and AND2(A2,B,ND);
    and AND3(A3,A,ND);
    and AND4(A4,NB,D);
    and AND5(A5,NA,A4);
    or OR1(O1,A1,A2);
    or OR2(O2,O1,A3);
    or OR3(Dg,O2,A5);
endmodule

//--------------------------------------------------------------

//Module DECODER_Ia
module DECODER_Ia(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Ia
);

    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,A8,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,B,NC);
    and AND2(A2,A,NC);
    and AND3(A3,NB,C);
    and AND4(A4,B,D);
    and AND5(A5,B,ND);
    and AND6(A6,NA,A3);
    and AND7(A7,NA,A4);
    and AND8(A8,A,A5);
    or OR1(O1,A1,A2);
    or OR2(O2,O1,A6);
    or OR3(O3,O2,A7);
    or OR4(Ia,O3,A8);
endmodule

//Module DECODER_Ib
module DECODER_Ib(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Ib
);

    wire  NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,
          O1,O2,O3,O4;

    //declarations
    not N1(NB,B);
    not N2(NC,C);
    not N3(ND,D);
    and AND1(A1,A,ND);
    and AND2(A2,C,ND);
    and AND3(A3,NB,NC);
    and AND4(A4,C,D);
    and AND5(A5,NB,A2);
    and AND6(A6,A,A3);
    and AND7(A7,B,A4);
    or OR1(O1,A1,A5);
    or OR2(O2,O1,A6);
    or OR3(Ib,O2,A7);
endmodule

//Module DECODER_Ic
module DECODER_Ic(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Ic
);

    wire  NB,NC,ND,
          A1,A2,A3,A4,A5,
          O1,O2,O3,O4;

    //declarations
    not N1(NB,B);
    not N2(NC,C);
    not N3(ND,D);
    and AND1(A1,B,NC);
    and AND2(A2,A,ND);
    and AND3(A3,A,B);
    and AND4(A4,C,ND);
    and AND5(A5,NB,A4);
    or OR1(O1,A1,A2);
    or OR2(O2,O1,A3);
    or OR3(Ic,O2,A5);
endmodule

//Module DECODER_Id
module DECODER_Id(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Id
);

    wire  NA,NC,ND,
          A1,A2,A3,A4,A5,A6,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NC,C);
    not N3(ND,D);
    and AND1(A1,B,NC);
    and AND2(A2,A,NC);
    and AND3(A3,B,D);
    and AND4(A4,B,ND);
    and AND5(A5,NA,A3);
    and AND6(A6,A,A4);
    or OR1(O1,A1,A2);
    or OR2(O2,O1,A5);
    or OR3(Id,O2,A6);
endmodule

//Module DECODER_Ie
module DECODER_Ie(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Ie
);

    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,A6,A7,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,A,NC);
    and AND2(A2,NB,C);
    and AND3(A3,C,D);
    and AND4(A4,B,ND);
    and AND5(A5,NA,A2);
    and AND6(A6,NA,A3);
    and AND7(A7,A,A4);
    or OR1(O1,A1,A5);
    or OR2(O2,O1,A6);
    or OR3(Ie,O2,A7);
endmodule

//Module DECODER_If
module DECODER_If(
    // Inputs and outputs declaration
    input A,B,C,D,
    output If
);

    wire  NA,NB,NC,ND,
          A1,A2,A3,A4,A5,
          O1,O2,O3,O4;

    //declarations
    not N1(NA,A);
    not N2(NB,B);
    not N3(NC,C);
    not N4(ND,D);
    and AND1(A1,B,NC);
    and AND2(A2,A,ND);
    and AND3(A3,A,B);
    and AND4(A4,NB,C);
    and AND5(A5,NA,A4);
    or OR1(O1,A1,A2);
    or OR2(O2,O1,A3);
    or OR3(If,O2,A5);
endmodule

//Module DECODER_Ig
module DECODER_Ig(
    // Inputs and outputs declaration
    input A,B,C,D,
    output Ig
);

    wire  NA,ND,
          A1,A2,A3,
          O1,O2;

    //declarations
    not N1(NA,A);
    not N2(ND,D);
    and AND1(A1,C,ND);
    and AND2(A2,NA,B);
    and AND3(A3,A,D);
    or OR1(O1,A1,A2);
    or OR2(Ig,O1,A3);
endmodule


//--------------------------------------------------------------
//Module MAIN
module MAIN(
    // Inputs and outputs declaration
    input E,CLK_IN,
    output Da,Db,Dc,Dd,De,Df,Dg,
           Ia,Ib,Ic,Id,Ie,If,Ig
);
    wire  CLK_OUT,A,B,C,D,
          D0,D1,D2,D3;

    //Instantiates
    CLOCK_DIVIDER CLK_DVD (
        .clock_in(CLOCK_IN),
        .clock_out(CLK_OUT)
    );

    INPUTS_FF_D3 I_FF_D3 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),

        .D3(D3)
    );

    INPUTS_FF_D2 I_FF_D2 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),

        .D2(D2)
    );

    INPUTS_FF_D1 I_FF_D1 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),

        .D1(D1)
    );

    INPUTS_FF_D0 I_FF_D0 (
        .E(E),

        .D0(D0)
    );

    FF_D FF_A (
        .D(D3),
        .CLK(CLK_OUT),

        .Q(A)
    );

    FF_D FF_B (
        .D(D2),
        .CLK(CLK_OUT),

        .Q(B)
    );

    FF_D FF_C (
        .D(D1),
        .CLK(CLK_OUT),

        .Q(C)
    );

    FF_D FF_D (
        .D(D0),
        .CLK(CLK_OUT),

        .Q(D)
    );

    DECODER_Da DEC_Da (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Da(Da)
    );

    DECODER_Db DEC_Db (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Db(Db)
    );

    DECODER_Dc DEC_Dc (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Dc(Dc)
    );

    DECODER_Dd DEC_Dd (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Dd(Dd)
    );

    DECODER_De DEC_De (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .De(De)
    );

    DECODER_Df DEC_Df (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Df(Df)
    );

    DECODER_Dg DEC_Dg (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Dg(Dg)
    );

    DECODER_Ia DEC_Ia (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Ia(Ia)
    );

    DECODER_Ib DEC_Ib (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Ib(Ib)
    );

    DECODER_Ic DEC_Ic (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Ic(Ic)
    );

    DECODER_Id DEC_Id (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Id(Id)
    );

    DECODER_Ie DEC_Ie (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Ie(Ie)
    );

    DECODER_If DEC_If (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .If(If)
    );

    DECODER_Ig DEC_Ig (
        .A(A),
        .B(B),
        .C(C),
        .D(D),

        .Ig(Ig)
    );
endmodule

