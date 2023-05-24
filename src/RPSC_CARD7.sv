// Reset is modifiedi4_FF1_Emergency_IN
// Unsure: 77 LT and LAMPTEST
module RPSC_CARD7(clk, reset, reset_hold_error, LA_Test,
                    i4_FF1_Emergency_IN, 
                    i17_FF2_Card_POS_IN, 
                    i23_FF3_Air_Grid_IN, 
                    i37_FF4_Air_Anode_IN, 
                    i43_FF5_Water_Heat_Exchanger_IN, 
                    i57_FF6_Water_Anode_IN, 
                    i63_FF7_Door_PAMP_IN, 
                    i76_FF8_GR_SW_IN,
                    o6_FF1_Emergency_OUT, o3_FF1_Emergency_LA,
                    o15_FF2_Card_POS_OUT, o19_FF2_Card_POS_LA,
                    o25_FF3_Air_Grid_OUT, o22_FF3_Air_Grid_LA,
                    o35_FF4_Air_Anode_OUT, o39_FF4_Air_Anode_LA,
                    o45_FF5_Water_Heat_Exchanger_OUT, o42_FF5_Water_Heat_Exchanger_LA,
                    o55_FF6_Water_Anode_OUT, o59_FF6_Water_Anode_LA,
                    o65_FF7_Door_PAMP_OUT, o62_FF7_Door_PAMP_LA,
                    o74_FF8_GR_SW_OUT, o78_FF8_GR_SW_LA);

    input logic clk, reset, reset_hold_error, LA_Test;
    input logic i4_FF1_Emergency_IN, 
                i17_FF2_Card_POS_IN, 
                i23_FF3_Air_Grid_IN, 
                i37_FF4_Air_Anode_IN, 
                i43_FF5_Water_Heat_Exchanger_IN, 
                i57_FF6_Water_Anode_IN, 
                i63_FF7_Door_PAMP_IN, 
                i76_FF8_GR_SW_IN;
    
    output logic o6_FF1_Emergency_OUT, o3_FF1_Emergency_LA,
                 o15_FF2_Card_POS_OUT, o19_FF2_Card_POS_LA,
                 o25_FF3_Air_Grid_OUT, o22_FF3_Air_Grid_LA,
                 o35_FF4_Air_Anode_OUT, o39_FF4_Air_Anode_LA,
                 o45_FF5_Water_Heat_Exchanger_OUT, o42_FF5_Water_Heat_Exchanger_LA,
                 o55_FF6_Water_Anode_OUT, o59_FF6_Water_Anode_LA,
                 o65_FF7_Door_PAMP_OUT, o62_FF7_Door_PAMP_LA,
                 o74_FF8_GR_SW_OUT, o78_FF8_GR_SW_LA;


    FF FF1 (
        .out(o6_FF1_Emergency_OUT), 
        .LA(o3_FF1_Emergency_LA), 
        .in(i4_FF1_Emergency_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF2 (
        .out(o15_FF2_Card_POS_OUT), 
        .LA(o19_FF2_Card_POS_LA), 
        .in(i17_FF2_Card_POS_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF3 (
        .out(o25_FF3_Air_Grid_OUT), 
        .LA(o22_FF3_Air_Grid_LA), 
        .in(i23_FF3_Air_Grid_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF4 (
        .out(o35_FF4_Air_Anode_OUT), 
        .LA(o39_FF4_Air_Anode_LA), 
        .in(i37_FF4_Air_Anode_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF_Hold_Error FF5 (
        .out(o45_FF5_Water_Heat_Exchanger_OUT), 
        .LA(o42_FF5_Water_Heat_Exchanger_LA), 
        .in(i43_FF5_Water_Heat_Exchanger_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF_Hold_Error FF6 (
        .out(o55_FF6_Water_Anode_OUT), 
        .LA(o59_FF6_Water_Anode_LA), 
        .in(i57_FF6_Water_Anode_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF7 (
        .out(o65_FF7_Door_PAMP_OUT), 
        .LA(o62_FF7_Door_PAMP_LA), 
        .in(i63_FF7_Door_PAMP_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF8 (
        .out(o74_FF8_GR_SW_OUT), 
        .LA(o78_FF8_GR_SW_LA), 
        .in(i76_FF8_GR_SW_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

endmodule
