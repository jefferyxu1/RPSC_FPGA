module RPSC_CARD9(clk, reset_from_card6_45,
    i4_FF17_G1_PS_Fault_IN, 
    i17_FF18_G2_PS_Fault_IN,
    i23_FF19_Temp_DR_AMP_IN,
    i37_FF20_AN_PS_Fault_IN,
    i43_FF21_AN_PS_Over_Current_IN,
    i57_FF22_I_G1_High_IN,
    i63_FF23_G1_PS_Over_Temp_IN,
    i76_FF24_G2_PS_Internal_Fault_IN,
    o6_FF17_G1_PS_Fault_OUT, o3_FF17_G1_PS_Fault_LA,
    o15_FF18_G2_PS_Fault_OUT, o19_FF18_G2_PS_Fault_LA,
    o25_FF19_Temp_DR_AMP_OUT, o22_FF19_Temp_DR_AMP_LA,
    o35_FF20_AN_PS_Fault_OUT, o39_FF20_AN_PS_Fault_LA,
    o42_FF21_AN_PS_Over_Current_LA,
    o59_FF22_I_G1_High_LA,
    o62_FF23_G1_PS_Over_Temp_LA,
    o78_FF24_G2_PS_Internal_Fault_LA);

    input logic clk, reset_from_card6,
        i4_FF17_G1_PS_Fault_IN, 
        i17_FF18_G2_PS_Fault_IN,
        i23_FF19_Temp_DR_AMP_IN,
        i37_FF20_AN_PS_Fault_IN,
        i43_FF21_AN_PS_Over_Current_IN,
        i57_FF22_I_G1_High_IN,
        i63_FF23_G1_PS_Over_Temp_IN,
        i76_FF24_G2_PS_Internal_Fault_IN;

    output logic o6_FF17_G1_PS_Fault_OUT, o3_FF17_G1_PS_Fault_LA,
        o15_FF18_G2_PS_Fault_OUT, o19_FF18_G2_PS_Fault_LA,
        o25_FF19_Temp_DR_AMP_OUT, o22_FF19_Temp_DR_AMP_LA,
        o35_FF20_AN_PS_Fault_OUT, o39_FF20_AN_PS_Fault_LA,
        o42_FF21_AN_PS_Over_Current_LA,
        o59_FF22_I_G1_High_LA,
        o62_FF23_G1_PS_Over_Temp_LA,
        o78_FF24_G2_PS_Internal_Fault_LA;

endmodule