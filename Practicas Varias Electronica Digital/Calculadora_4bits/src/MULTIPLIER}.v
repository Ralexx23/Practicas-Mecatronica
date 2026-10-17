//Module Multiplier 4 BITS
module MULTIPLIER_4BITS(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

    //--------------------------------------------
    // 1. Productos parciales (bitwise AND)
    //--------------------------------------------
    wire PP0_0, PP0_1, PP0_2, PP0_3;
    wire PP1_0, PP1_1, PP1_2, PP1_3;
    wire PP2_0, PP2_1, PP2_2, PP2_3;
    wire PP3_0, PP3_1, PP3_2, PP3_3;

    and (PP0_0, A[0], B[0]);
    and (PP0_1, A[1], B[0]);
    and (PP0_2, A[2], B[0]);
    and (PP0_3, A[3], B[0]);

    and (PP1_0, A[0], B[1]);
    and (PP1_1, A[1], B[1]);
    and (PP1_2, A[2], B[1]);
    and (PP1_3, A[3], B[1]);

    and (PP2_0, A[0], B[2]);
    and (PP2_1, A[1], B[2]);
    and (PP2_2, A[2], B[2]);
    and (PP2_3, A[3], B[2]);

    and (PP3_0, A[0], B[3]);
    and (PP3_1, A[1], B[3]);
    and (PP3_2, A[2], B[3]);
    and (PP3_3, A[3], B[3]);

    //--------------------------------------------
    // 2. Suma de productos parciales
    //    (Etapa 1: PP0 y PP1)
    //--------------------------------------------
    wire [3:0] S1;
    wire C1_0, C1_1, C1_2, C1; // carries internos

    assign P[0] = PP0_0; // primer bit del producto

    // Suma desplazada: (PP0 << 1) + PP1
    FULL_ADDER FA1_0 (
        .A(PP1_0),
        .B(PP0_1),
        .Cin(1'b0),

        .S(S1[0]),
        .Cout(C1_0)
    );
    FULL_ADDER FA1_1 (
        .A(PP1_1),
        .B(PP0_2),
        .Cin(C1_0),

        .S(S1[1]),
        .Cout(C1_1)
    );
    FULL_ADDER FA1_2 (
        .A(PP1_2),
        .B(PP0_3),
        .Cin(C1_1),

        .S(S1[2]),
        .Cout(C1_2)
    );
    FULL_ADDER FA1_3 (
        .A(PP1_3),
        .B(1'b0),
        .Cin(C1_2),

        .S(S1[3]),
        .Cout(C1)
    );
    //--------------------------------------------
    // 3. Suma de productos parciales
    //    (Etapa 2: S1 y PP2)
    //--------------------------------------------
    wire [3:0] S2;
    wire C2_0, C2_1, C2_2, C2; // carries internos
    // Suma desplazada: (S1 << 1) + PP2
    FULL_ADDER FA2_0 (
        .A(PP2_0),
        .B(S1[1]),
        .Cin(1'b0),

        .S(S2[0]),
        .Cout(C2_0)
    );
    FULL_ADDER FA2_1 (
        .A(PP2_1),
        .B(S1[2]),
        .Cin(C2_0),

        .S(S2[1]),
        .Cout(C2_1)
    );
    FULL_ADDER FA2_2 (
        .A(PP2_2),
        .B(S1[3]),
        .Cin(C2_1),

        .S(S2[2]),
        .Cout(C2_2)
    );
    FULL_ADDER FA2_3 (
        .A(PP2_3),
        .B(C1),
        .Cin(C2_2),

        .S(S2[3]),
        .Cout(C2)
    );
    //--------------------------------------------
    // 4. Suma de productos parciales
    //    (Etapa 3: S2 y PP3)
    //--------------------------------------------
    wire [3:0] S3;
    wire C3_0, C3_1, C3_2, C3; // carries internos
    // Suma desplazada: (S2 << 1) + PP3
    FULL_ADDER FA3_0 (
        .A(PP3_0),
        .B(S2[1]),
        .Cin(1'b0),

        .S(S3[0]),
        .Cout(C3_0)
    );
    FULL_ADDER FA3_1 (
        .A(PP3_1),
        .B(S2[2]),
        .Cin(C3_0),

        .S(S3[1]),
        .Cout(C3_1)
    );
    FULL_ADDER FA3_2 (
        .A(PP3_2),
        .B(S2[3]),
        .Cin(C3_1),

        .S(S3[2]),
        .Cout(C3_2)
    );
    FULL_ADDER FA3_3 (
        .A(PP3_3),
        .B(C2),
        .Cin(C3_2),

        .S(S3[3]),
        .Cout(C3)
    );
    //--------------------------------------------
    // 5. Asignar el resultado final
    //--------------------------------------------
    assign P[1] = S1[0];
    assign P[2] = S2[0];
    assign P[3] = S3[0];
    assign P[4] = S3[1];
    assign P[5] = S3[2];
    assign P[6] = S3[3];
    assign P[7] = C3;
endmodule