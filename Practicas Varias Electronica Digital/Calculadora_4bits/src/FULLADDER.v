//Module FULL ADDER
module FULL_ADDER(
    // Inputs and outputs declaration
    input A,B,Cin,
    output S, Cout
);
    
    //Internal wires
    wire S1,C1,C2;

    //Full Adder Declarations
    xor X1(S1,A,B);
    xor X2(S,S1,Cin);
    and A1(C1,A,B);
    and A2(C2,S1,Cin);
    or O1(Cout,C1,C2);       
endmodule