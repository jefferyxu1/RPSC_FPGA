module RPSC_CARD8(clk, reset,
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
    input logic clk, reset,
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

endmodule
