module tabla_verdad_mux(
    input A, B, C, D, E,      // Entradas de la tabla
    input [1:0] S,            // Selector del MUX (00=Fa, 01=Fb, 10=Fc, 11=Fd)
    output F,                 // Salida seleccionada
    output [6:0] seg1,        // Display de 7 segmentos para unidades
    output [6:0] seg2         // Display de 7 segmentos para decenas
);

    // =========================
    // Funciones internas
    // =========================
    wire Fa, Fb, Fc, Fd;

    // -------- Fa --------
    assign Fa = (~A & ~B & ~C & ~D & ~E) |
                (~A & ~B & ~C & ~D &  E) |
                (~A &  B & ~C & ~D & ~E) |
                (~A &  B & ~C &  D &  E) |
                (~A &  B &  C & ~D & ~E) |
                ( A & ~B & ~C &  D &  E) |
                ( A &  B & ~C & ~D & ~E);

    // -------- Fb --------
    assign Fb = (~A & ~B & ~C & ~D & ~E) |
                (~A & ~B & ~C & ~D &  E) |
                (~A &  B & ~C & ~D & ~E) |
                (~A &  B & ~C &  D &  E) |
                (~A &  B &  C &  D &  E) |
                ( A & ~B & ~C &  D &  E) |
                ( A &  B & ~C & ~D & ~E) |
                ( A &  B & ~C & ~D &  E);

    // -------- Fc --------
    assign Fc = (~A & ~B & ~C & ~D &  E) |
                (~A & ~B &  C & ~D & ~E) |
                (~A & ~B &  C &  D & ~E) |
                ( A & ~B & ~C & ~D &  E) |
                ( A & ~B &  C & ~D &  E) |
                ( A &  B & ~C & ~D & ~E) |
                ( A &  B & ~C & ~D &  E) |
                ( A &  B &  C & ~D &  E);

    // -------- Fd --------
    assign Fd = ( A & ~B & ~C & ~D & ~E) |
                ( A & ~B & ~C &  D & ~E) |
                ( A & ~B &  C & ~D & ~E) |
                ( A & ~B &  C &  D & ~E) |
                ( A &  B &  C &  D &  E);

    // =========================
    // MUX 4 a 1
    // =========================
    assign F = (S == 2'b00) ? Fa :
               (S == 2'b01) ? Fb :
               (S == 2'b10) ? Fc :
                              Fd;

    // =========================
    // Convertidor Binario a BCD de 5 bits
    // =========================
    reg [3:0] bcd_decenas;
    reg [3:0] bcd_unidades;
    
    always @(*) begin
        case({A, B, C, D, E})
            5'b00000: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0000; end // 0
            5'b00001: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0001; end // 1
            5'b00010: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0010; end // 2
            5'b00011: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0011; end // 3
            5'b00100: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0100; end // 4
            5'b00101: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0101; end // 5
            5'b00110: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0110; end // 6
            5'b00111: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0111; end // 7
            5'b01000: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b1000; end // 8
            5'b01001: begin bcd_decenas = 4'b0000; bcd_unidades = 4'b1001; end // 9
            5'b01010: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0000; end // 10
            5'b01011: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0001; end // 11
            5'b01100: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0010; end // 12
            5'b01101: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0011; end // 13
            5'b01110: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0100; end // 14
            5'b01111: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0101; end // 15
            5'b10000: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0110; end // 16
            5'b10001: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b0111; end // 17
            5'b10010: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b1000; end // 18
            5'b10011: begin bcd_decenas = 4'b0001; bcd_unidades = 4'b1001; end // 19
            5'b10100: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0000; end // 20
            5'b10101: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0001; end // 21
            5'b10110: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0010; end // 22
            5'b10111: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0011; end // 23
            5'b11000: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0100; end // 24
            5'b11001: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0101; end // 25
            5'b11010: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0110; end // 26
            5'b11011: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b0111; end // 27
            5'b11100: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b1000; end // 28
            5'b11101: begin bcd_decenas = 4'b0010; bcd_unidades = 4'b1001; end // 29
            5'b11110: begin bcd_decenas = 4'b0011; bcd_unidades = 4'b0000; end // 30
            5'b11111: begin bcd_decenas = 4'b0011; bcd_unidades = 4'b0001; end // 31
            default:  begin bcd_decenas = 4'b0000; bcd_unidades = 4'b0000; end
        endcase
    end
    
    // =========================
    // Decodificador BCD a 7 segmentos (cátodo común)
    // =========================
    reg [6:0] seg_decenas;
    reg [6:0] seg_unidades;
    
    // Decodificador para unidades
    always @(*) begin
        case(bcd_unidades)
            4'b0000: seg_unidades = 7'b0111111; // 0
            4'b0001: seg_unidades = 7'b0000110; // 1
            4'b0010: seg_unidades = 7'b1011011; // 2
            4'b0011: seg_unidades = 7'b1001111; // 3
            4'b0100: seg_unidades = 7'b1100110; // 4
            4'b0101: seg_unidades = 7'b1101101; // 5
            4'b0110: seg_unidades = 7'b1111101; // 6
            4'b0111: seg_unidades = 7'b0000111; // 7
            4'b1000: seg_unidades = 7'b1111111; // 8
            4'b1001: seg_unidades = 7'b1101111; // 9
            default: seg_unidades = 7'b0000000;  // Apagado
        endcase
    end
    
    // Decodificador para decenas
    always @(*) begin
        case(bcd_decenas)
            4'b0000: seg_decenas = 7'b0111111; // 0
            4'b0001: seg_decenas = 7'b0000110; // 1
            4'b0010: seg_decenas = 7'b1011011; // 2
            4'b0011: seg_decenas = 7'b1001111; // 3
            default: seg_decenas = 7'b0000000;  // Apagado
        endcase
    end
    
    assign seg1 = seg_unidades;
    assign seg2 = seg_decenas;

endmodule