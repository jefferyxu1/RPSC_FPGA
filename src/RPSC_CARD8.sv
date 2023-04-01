module RPSC_CARD8(clk, reset,
                    i4_FF9_IN,
                    i17_FF10_IN,
                    i23_FF11_IN,
                    i37_FF12_IN,
                    i43_FF13_IN,
                    i57_FF14_IN,
                    i76_FF16_IN,
                    o6_FF9_OUT, o3_FF9_LA, o9_FF9_PAMP_Interlock,
                    o22_FF11_LA,
                    o39_FF12_LA,
                    o42_FF13_LA,
                    o59_FF14_LA,
                    o78_FF16_LA);
    // Not done: LAMPTEST 
    input logic clk, reset,
                i4_FF9_IN,
                i17_FF10_IN,
                i23_FF11_IN,
                i37_FF12_IN,
                i43_FF13_IN,
                i57_FF14_IN,
                i76_FF16_IN;
    
    output logic o6_FF9_OUT, o3_FF9_LA, o9_FF9_PAMP_Interlock, // EP8 is gone, but still goes to Card7-66
                 o19_FF10_LA, 
                 o22_FF11_LA,
                 o39_FF12_LA,
                 o42_FF13_LA,
                 o59_FF14_LA,
                 o78_FF16_LA; 

endmodule
