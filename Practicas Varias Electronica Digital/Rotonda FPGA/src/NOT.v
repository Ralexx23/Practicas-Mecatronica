//Module NOT1
module NOT1(
    // Inputs and outputs declaration
    input NE1,NE2,NE3,NE4,
    output NS1,NS2,NS3,NS4
);
    
    //NOT Declarations
    not N1(NS1,NE1);
    not N2(NS2,NE2);
    not N3(NS3,NE3);
    not N4(NS4,NE4);

endmodule