// multiple reset in this card
module RPSC_CARD12(clk, reset, reset_hold_error, LA_Test,
                    i4_FF41_U_CA_Low_IN, 
                    i17_FF42_I_CA_High_IN,
                    i23_FF43_U_G1_Low_IN,
                    i37_FF44_U_AN_Low_IN,
                    i43_FF45_I_AN_High_IN,
                    i57_FF46_U_G2_Low_IN,
                    i63_FF47_DC_PS_Low_IN,
                    i76_FF48_Alarm_IN,
                    o6_FF41_U_CA_Low_OUT, o3_FF41_U_CA_Low_LA,
                    o15_FF42_I_CA_High_OUT, o19_FF42_I_CA_High_LA,
                    o25_FF43_U_G1_Low_OUT, o22_FF43_U_G1_Low_LA,
                    o35_FF44_U_AN_Low_OUT, o39_FF44_U_AN_Low_LA,
                    o45_FF45_I_AN_High_OUT, o42_FF45_I_AN_High_LA,
                    o55_FF46_U_G2_Low_OUT, o59_FF46_U_G2_Low_LA,
                    o65_FF47_DC_PS_Low_OUT, o62_FF47_DC_PS_Low_LA,
                    o78_FF48_Alarm_LA);

    input logic clk, reset, reset_hold_error, LA_Test,
                i4_FF41_U_CA_Low_IN, 
                i17_FF42_I_CA_High_IN,
                i23_FF43_U_G1_Low_IN,
                i37_FF44_U_AN_Low_IN,
                i43_FF45_I_AN_High_IN,
                i57_FF46_U_G2_Low_IN,
                i63_FF47_DC_PS_Low_IN,
                i76_FF48_Alarm_IN;
                
    output logic o6_FF41_U_CA_Low_OUT, o3_FF41_U_CA_Low_LA,
                 o15_FF42_I_CA_High_OUT, o19_FF42_I_CA_High_LA,
                 o25_FF43_U_G1_Low_OUT, o22_FF43_U_G1_Low_LA,
                 o35_FF44_U_AN_Low_OUT, o39_FF44_U_AN_Low_LA,
                 o45_FF45_I_AN_High_OUT, o42_FF45_I_AN_High_LA,
                 o55_FF46_U_G2_Low_OUT, o59_FF46_U_G2_Low_LA,
                 o65_FF47_DC_PS_Low_OUT, o62_FF47_DC_PS_Low_LA,
                 o78_FF48_Alarm_LA;

    FF_Hold_Error FF41 (
        .out(o6_FF41_U_CA_Low_OUT), 
        .LA(o3_FF41_U_CA_Low_LA), 
        .in(i4_FF41_U_CA_Low_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF_Hold_Error FF42 (
        .out(o15_FF42_I_CA_High_OUT), 
        .LA(o19_FF42_I_CA_High_LA), 
        .in(i17_FF42_I_CA_High_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF_Hold_Error FF43 (
        .out(o25_FF43_U_G1_Low_OUT), 
        .LA(o22_FF43_U_G1_Low_LA), 
        .in(i23_FF43_U_G1_Low_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF44 (
        .out(o35_FF44_U_AN_Low_OUT), 
        .LA(o39_FF44_U_AN_Low_LA), 
        .in(i37_FF44_U_AN_Low_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF_Hold_Error FF45 (
        .out(o45_FF45_I_AN_High_OUT), 
        .LA(o42_FF45_I_AN_High_LA), 
        .in(i43_FF45_I_AN_High_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF_Hold_Error FF46 (
        .out(o55_FF46_U_G2_Low_OUT), 
        .LA(o59_FF46_U_G2_Low_LA), 
        .in(i57_FF46_U_G2_Low_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF_Hold_Error FF47 (
        .out(o65_FF47_DC_PS_Low_OUT), 
        .LA(o62_FF47_DC_PS_Low_LA), 
        .in(i63_FF47_DC_PS_Low_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF48 (
        .out(), 
        .LA(o78_FF48_Alarm_LA), 
        .in(i76_FF48_Alarm_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

endmodule
    