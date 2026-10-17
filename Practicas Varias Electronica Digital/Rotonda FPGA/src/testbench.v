`timescale 1ns/1ps
module tb_mi_circuito;
    reg A, B,C,D;
    wire S0, S1, S2, S3;

    // Instancia de tu módulo principal
    TRAFFIC_LIGHT (.A(A), .B(B), .C(C), .D(D), .S0(S0), .S1(S1), .S2(S2), .S3(S3));

    initial begin
        $display("A B C D | S0 S1 S2 S3");
        $monitor("%b %b %b %b | %b %b %b %b", A, B, C, D, S0, S1, S2, S3);
        A = 0; B = 0; C = 0; D = 1; #10;
        A = 0; B = 0; C = 1; D = 0; #10;
        A = 0; B = 0; C = 1; D = 1; #10;
        A = 0; B = 1; C = 0; D = 0; #10;
        $finish;
    end
endmodule