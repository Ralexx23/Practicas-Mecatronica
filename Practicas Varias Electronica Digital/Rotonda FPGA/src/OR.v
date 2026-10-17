//Module OR1
module OR1(
    // Inputs and outputs declaration
    input OE1,OE2,OE3,OE4,OE5,OE6,OE7,OE8,
    output OS1,OS2,OS3,OS4
);
    
    //OR declarations
    or O1(OS1,OE1,OE2);
    or O2(OS2,OE3,OE4);
    or O3(OS3,OE5,OE6);
    or O4(OS4,OE7,OE8);

endmodule

//Module OR2
module OR2(
    // Inputs and outputs declaration
    input OE1,OE2,OE3,OE4,OE5,OE6,OE7,OE8,
    output OS1,OS2,OS3,OS4
);
    
    //OR Declarations
    or O1(OS1,OE1,OE2);
    or O2(OS2,OE3,OE4);
    or O3(OS3,OE5,OE6);
    or O4(OS4,OE7,OE8);

endmodule