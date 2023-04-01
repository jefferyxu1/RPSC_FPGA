// Reset is modified
// Unsure: 77 LT and LAMPTEST
module RPSC_CARD7(clk, reset, i4_FF1_IN, 
    i17_FF2_IN, 
    i23_FF3_IN, 
    i37_FF4_IN, 
    i43_FF5_IN, 
    i57_FF6_IN, 
    i63_FF7_IN, 
    i76_FF8_IN,
    o6_FF1_OUT, o3_FF1_LA, o9_Emergency,
                 o15_FF2_OUT, o19_FF2_LA,
                 o25_FF3_OUT, o22_FF3_LA,
                 o35_FF4_OUT, o39_FF4_LA,
                 o45_FF5_OUT, o42_FF5_LA,
                 o55_FF6_OUT, o59_FF6_LA,
                 o65_FF7_OUT, o62_FF7_LA,
                 o74_FF8_OUT, o78_FF8_LA);

    input logic clk, reset;
    input logic i4_FF1_IN, 
    i17_FF2_IN, 
    i23_FF3_IN, 
    i37_FF4_IN, 
    i43_FF5_IN, 
    i57_FF6_IN, 
    i63_FF7_IN, 
    i76_FF8_IN;
    
    output logic o6_FF1_OUT, o3_FF1_LA, o9_Emergency,
                 o15_FF2_OUT, o19_FF2_LA,
                 o25_FF3_OUT, o22_FF3_LA,
                 o35_FF4_OUT, o39_FF4_LA,
                 o45_FF5_OUT, o42_FF5_LA,
                 o55_FF6_OUT, o59_FF6_LA,
                 o65_FF7_OUT, o62_FF7_LA,
                 o74_FF8_OUT, o78_FF8_LA;

    output logic o_PAMP_Interlock; // Integrate output 26,34,46,54,66,73
    assign o_PAMP_Interlock = 1'b0; // Not implemented yet

endmodule
