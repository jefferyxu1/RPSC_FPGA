module RPSC_CARD9(clk, reset_from_card6_45,
    i4_FF17_IN, 
    i17_FF18_IN,
    i23_FF19_IN,
    i37_FF20_IN,
    i43_FF21_IN,
    i57_FF22_IN,
    i63_FF23_IN,
    i76_FF24_IN,
    o6_FF17_OUT, o3_FF17_LA,
    o15_FF18_OUT, o19_FF18_LA,
    o25_FF19_OUT, o22_FF19_LA,
    o35_FF20_OUT, o39_FF20_LA,
    o42_FF21_LA,
    o59_FF22_LA,
    o62_FF23_LA,
    o78_FF24_LA);

    input logic clk, reset_from_card6,
        i4_FF17_IN, 
        i17_FF18_IN,
        i23_FF19_IN,
        i37_FF20_IN,
        i43_FF21_IN,
        i57_FF22_IN,
        i63_FF23_IN,
        i76_FF24_IN;

    output logic o6_FF17_OUT, o3_FF17_LA,
        o15_FF18_OUT, o19_FF18_LA,
        o25_FF19_OUT, o22_FF19_LA,
        o35_FF20_OUT, o39_FF20_LA,
        o42_FF21_LA,
        o59_FF22_LA,
        o62_FF23_LA,
        o78_FF24_LA;

endmodule