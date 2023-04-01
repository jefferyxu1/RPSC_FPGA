// multiple reset in this card
module RPSC_CARD12(clk, reset_from_card6_45,
                    i4_FF41_IN, 
                    i17_FF42_IN,
                    i23_FF43_IN,
                    i37_FF44_IN,
                    i43_FF45_IN,
                    i57_FF46_IN,
                    i63_FF47_IN,
                    i76_FF48_IN,
                    o6_FF41_OUT, o3_FF41_LA,
                    o15_FF42_OUT, o19_FF42_LA,
                    o25_FF43_OUT, o22_FF43_LA,
                    o35_FF44_OUT, o39_FF44_LA,
                    o45_FF45_OUT, o42_FF45_LA,
                    o55_FF46_OUT, o59_FF46_LA,
                    o65_FF47_OUT, o62_FF47_LA,
                    o78_FF48_LA);

    input logic clk, reset_from_card6,
                i4_FF41_IN, 
                i17_FF42_IN,
                i23_FF43_IN,
                i37_FF44_IN,
                i43_FF45_IN,
                i57_FF46_IN,
                i63_FF47_IN,
                i76_FF48_IN;
                
    output logic o6_FF41_OUT, o3_FF41_LA,
                 o15_FF42_OUT, o19_FF42_LA,
                 o25_FF43_OUT, o22_FF43_LA,
                 o35_FF44_OUT, o39_FF44_LA,
                 o45_FF45_OUT, o42_FF45_LA,
                 o55_FF46_OUT, o59_FF46_LA,
                 o65_FF47_OUT, o62_FF47_LA,
                 o78_FF48_LA;

endmodule
    