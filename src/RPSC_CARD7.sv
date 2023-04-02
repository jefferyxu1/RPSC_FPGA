// Reset is modifiedi4_FF1_Emergency_IN
// Unsure: 77 LT and LAMPTEST
module RPSC_CARD7(clk, reset, i4_FF1_Emergency_IN, 
                    i17_FF2_Card_POS_IN, 
                    i23_FF3_Air_Grid_IN, 
                    i37_FF4_Air_Anode_IN, 
                    i43_FF5_Water_Heat_Exchanger_IN, 
                    i57_FF6_Water_Anode_IN, 
                    i63_FF7_Door_PAMP_IN, 
                    i76_FF8_GR_SW_IN,
                    o6_FF1_Emergency_OUT, o3_FF1_Emergency_LA, o9_Emergency,
                    o15_FF2_Card_POS_OUT, o19_FF2_Card_POS_LA,
                    o25_FF3_Air_Grid_OUT, o22_FF3_Air_Grid_LA,
                    o35_FF4_Air_Anode_OUT, o39_FF4_Air_Anode_LA,
                    o45_FF5_Water_Heat_Exchanger_OUT, o42_FF5_Water_Heat_Exchanger_LA,
                    o55_FF6_Water_Anode_OUT, o59_FF6_Water_Anode_LA,
                    o65_FF7_Door_PAMP_OUT, o62_FF7_Door_PAMP_LA,
                    o74_FF8_GR_SW_OUT, o78_FF8_GR_SW_LA);

    input logic clk, reset;
    input logic i4_FF1_Emergency_IN, 
                i17_FF2_Card_POS_IN, 
                i23_FF3_Air_Grid_IN, 
                i37_FF4_Air_Anode_IN, 
                i43_FF5_Water_Heat_Exchanger_IN, 
                i57_FF6_Water_Anode_IN, 
                i63_FF7_Door_PAMP_IN, 
                i76_FF8_GR_SW_IN;
    
    output logic o6_FF1_Emergency_OUT, o3_FF1_Emergency_LA, o9_Emergency,
                 o15_FF2_Card_POS_OUT, o19_FF2_Card_POS_LA,
                 o25_FF3_Air_Grid_OUT, o22_FF3_Air_Grid_LA,
                 o35_FF4_Air_Anode_OUT, o39_FF4_Air_Anode_LA,
                 o45_FF5_Water_Heat_Exchanger_OUT, o42_FF5_Water_Heat_Exchanger_LA,
                 o55_FF6_Water_Anode_OUT, o59_FF6_Water_Anode_LA,
                 o65_FF7_Door_PAMP_OUT, o62_FF7_Door_PAMP_LA,
                 o74_FF8_GR_SW_OUT, o78_FF8_GR_SW_LA;

endmodule
