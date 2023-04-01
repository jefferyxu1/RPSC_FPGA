module RPSC_CARD10(clk, reset,
                    i4_FF25_IN,
                    i17_FF26_IN,
                    i23_FF27_IN,
                    i37_FF28_IN,
                    i43_FF29_IN,
                    i57_FF30_IN,
                    i63_FF31_IN,
                    i76_FF32_IN,
                    o3_FF25_LA,
                    o19_FF26_LA, o14_FF26_EP1_39,
                    o22_FF27_LA, 
                    o39_FF28_LA, o34_FF28_EP1_40,
                    o42_FF29_LA,
                    o59_FF30_LA,
                    o62_FF31_LA,
                    o78_FF32_LA);

    input logic clk, reset,
            i4_FF25_IN,
            i17_FF26_IN,
            i23_FF27_IN,
            i37_FF28_IN,
            i43_FF29_IN,
            i57_FF30_IN,
            i63_FF31_IN,
            i76_FF32_IN;

    output logic o3_FF25_LA,
                 o19_FF26_LA, o14_FF26_EP1_39,
                 o22_FF27_LA, 
                 o39_FF28_LA, o34_FF28_EP1_40,
                 o42_FF29_LA,
                 o59_FF30_LA,
                 o62_FF31_LA,
                 o78_FF32_LA;

endmodule