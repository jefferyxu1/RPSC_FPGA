// multiple reset in this card
module RPSC_CARD12(clk, reset,
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

    input logic clk, reset,
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

endmodule
    