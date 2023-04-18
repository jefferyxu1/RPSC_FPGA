module RPSC_CARD9(clk, reset, LA_Test,
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

    input logic clk, reset, LA_Test,
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

    FF FF17 (
        .out(o6_FF17_G1_PS_Fault_OUT), 
        .LA(o3_FF17_G1_PS_Fault_LA), 
        .in(i4_FF17_G1_PS_Fault_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF18 (
        .out(o15_FF18_G2_PS_Fault_OUT), 
        .LA(o19_FF18_G2_PS_Fault_LA), 
        .in(i17_FF18_G2_PS_Fault_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF19 (
        .out(o25_FF19_Temp_DR_AMP_OUT), 
        .LA(o22_FF19_Temp_DR_AMP_LA), 
        .in(i23_FF19_Temp_DR_AMP_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF20 (
        .out(o35_FF20_AN_PS_Fault_OUT), 
        .LA(o39_FF20_AN_PS_Fault_LA), 
        .in(i37_FF20_AN_PS_Fault_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF21 (
        .out(), 
        .LA(o42_FF21_AN_PS_Over_Current_LA), 
        .in(i43_FF21_AN_PS_Over_Current_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF22 (
        .out(), 
        .LA(o59_FF22_I_G1_High_LA), 
        .in(i57_FF22_I_G1_High_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF23 (
        .out(), 
        .LA(o62_FF23_G1_PS_Over_Temp_LA), 
        .in(i63_FF23_G1_PS_Over_Temp_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF24 (
        .out(), 
        .LA(o78_FF24_G2_PS_Internal_Fault_LA), 
        .in(i76_FF24_G2_PS_Internal_Fault_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

endmodule