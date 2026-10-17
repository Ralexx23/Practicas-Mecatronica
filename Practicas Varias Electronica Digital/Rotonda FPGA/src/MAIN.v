module TRAFFIC_LIGHT(
    // Inputs and outputs declaration
    input A,B,C,D,
    output S0,S1, S2 ,S3
);

    //Wires Declaration
    wire nwA, nwB, nwC, nwD; //not wires
    
    wire ow1, ow2, ow3, ow4;  //OR wires 
    
    wire aw1, aw2, aw3, aw4, aw5, aw6, aw7, //AND wires
         aw8, aw9, aw10, aw11, aw12; 
    
    //NOT module declaration
    NOT1 IC_NOT(
         .NE1(A),               // not 1
         .NE2(B),               // not 2
         .NE3(C),               // not 3
         .NE4(D),               // not 4

         .NS1(nwA), 
         .NS2(nwB), 
         .NS3(nwC), 
         .NS4(nwD)
    );

    //OR module declaration
    // IC1
    OR1 IC_OR1(
        .OE1(C),.OE2(D),       // or 1
        .OE3(ow1),.OE4(A),     // or 2
        .OE5(aw1),.OE6(aw2),   // or 3
        .OE7(ow2),.OE8(aw3),   // or 4
        
        .OS1(ow1),
        .OS2(S0),
        .OS3(ow2),
        .OS4(S1) 
    );

    // IC2
    OR2 IC_OR2(
        .OE1(aw4),.OE2(aw5),   // or 5
        .OE3(ow3),.OE4(aw7),   // or 6
        .OE5(aw8),.OE6(aw9),   // or 7
        .OE7(ow4),.OE8(aw12),       // or 8
        
        .OS1(ow3),
        .OS2(S2),
        .OS3(ow4),
        .OS4(S3) 
    );     

    //AND module declaration
    // IC1
    AND1 IC_AND1(
        .AE1(nwB),.AE2(D),   // and 1
        .AE3(nwA),.AE4(B),   // and 2
        .AE5(A),.AE6(nwB),   // and 3
        .AE7(B),.AE8(nwC),   // and 4

        .AS1(aw1),
        .AS2(aw2),
        .AS3(aw3),
        .AS4(aw4)
    ); 

    // IC2
    AND2 IC_AND2(
        .AE1(A),.AE2(nwC),   // and 5
        .AE3(nwB),.AE4(C),   // and 6
        .AE5(aw6),.AE6(nwA),   // and 7
        .AE7(C),.AE8(nwD),   // and 8

        .AS1(aw5),
        .AS2(aw6),
        .AS3(aw7),
        .AS4(aw8)
    ); 

    // IC3
    AND3 IC_AND3(
        .AE1(B),.AE2(nwD),   // and 9
        .AE3(nwC),.AE4(D),   // and 10
        .AE5(nwB),.AE6(aw10),   // and 11
        .AE7(aw11),.AE8(nwA),   // and 12

        .AS1(aw9),
        .AS2(aw10),
        .AS3(aw11),
        .AS4(aw12)
    ); 

endmodule