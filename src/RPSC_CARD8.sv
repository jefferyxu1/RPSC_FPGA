module RPSC_CARD8(clk, reset, LA_Test,
                    i4_FF9_HV_Connector_IN,
                    i17_FF10_G1_PS_Local_IN,
                    i23_FF11_Anode_PS_Local_IN,
                    i37_FF12_Anode_PS_Dummy_IN,
                    i43_FF13_G2_PS_Local_IN,
                    i57_FF14_I_G2_High_IN,
                    i76_FF16_FAN_OFF_Delay_IN,
                    o6_FF9_HV_Connector_OUT, o3_FF9_HV_Connector_LA,
                    o19_FF10_G1_PS_Local_LA,
                    o22_FF11_Anode_PS_Local_LA,
                    o39_FF12_Anode_PS_Dummy_LA,
                    o42_FF13_G2_PS_Local_LA,
                    o59_FF14_I_G2_High_LA,
                    o78_FF16_FAN_OFF_Delay_LA);
    // Not done: LAMPTEST 
    input logic clk, reset, LA_Test,
                i4_FF9_HV_Connector_IN,
                i17_FF10_G1_PS_Local_IN,
                i23_FF11_Anode_PS_Local_IN,
                i37_FF12_Anode_PS_Dummy_IN,
                i43_FF13_G2_PS_Local_IN,
                i57_FF14_I_G2_High_IN,
                i76_FF16_FAN_OFF_Delay_IN;
    
    output logic o6_FF9_HV_Connector_OUT, o3_FF9_HV_Connector_LA, // EP8 is gone, but still goes to Card7-66
                 o19_FF10_G1_PS_Local_LA, 
                 o22_FF11_Anode_PS_Local_LA,
                 o39_FF12_Anode_PS_Dummy_LA,
                 o42_FF13_G2_PS_Local_LA,
                 o59_FF14_I_G2_High_LA,
                 o78_FF16_FAN_OFF_Delay_LA; 

    FF FF9 (
        .out(o6_FF9_HV_Connector_OUT), 
        .LA(o3_FF9_HV_Connector_LA), 
        .in(i4_FF9_HV_Connector_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF10 (
        .out(), 
        .LA(o19_FF10_G1_PS_Local_LA), 
        .in(i17_FF10_G1_PS_Local_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF11 (
        .out(), 
        .LA(o22_FF11_Anode_PS_Local_LA), 
        .in(i23_FF11_Anode_PS_Local_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF12 (
        .out(), 
        .LA(o39_FF12_Anode_PS_Dummy_LA), 
        .in(i37_FF12_Anode_PS_Dummy_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF13 (
        .out(), 
        .LA(o42_FF13_G2_PS_Local_LA), 
        .in(i43_FF13_G2_PS_Local_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF14 (
        .out(), 
        .LA(o59_FF14_I_G2_High_LA), 
        .in(i57_FF14_I_G2_High_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF16 (
        .out(), 
        .LA(o78_FF16_FAN_OFF_Delay_LA), 
        .in(i76_FF16_FAN_OFF_Delay_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

endmodule
