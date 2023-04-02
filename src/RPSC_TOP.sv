module RPSC_TOP(clk, reset);

    // Naming Convention 
    // input/output examples: i_EP1_1, o_EP1_2
    // if EP is not a real IO, then EP1_3
    // Interconnecting different cards: C1_o55_Not_Alarm_to_C1_i48_Water_Grid, direction: output to input
    input logic clk, reset;
    input logic 
    output logic o_EP1_1, 
    output logic o_C1_BJT_78, o_C2_BJT_39, o_C2_BJT_78;


// ------------------------------------------------------
    // wire originate from this card declares here
    logic C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control,
          C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN,
          C1_o62_CA_ON_to_C10_i37_FF28_CA_ON_IN,
          C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN,
          C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK,
          C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN,
          C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN;


    RPSC_CARD1 card1 (
        .o55_Not_Alarm(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control), 
        .o47_CA_ON_PERM(C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN), 
        .o62_CA_ON(C1_o62_CA_ON_to_C10_i37_FF28_CA_ON_IN),
        .o74_CA_Delay(C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN), 
        .o75_Not_CA_OK(C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK),
        .o70_I_CA_High(C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN), 
        .o77_U_CA_Low(C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN), 
        .o78_Modified(o_C1_BJT_78),
        .clk(clk), 
        .reset(reset), 
        .i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low);


//----------------------------------------------------------
    logic C2_o19_Not_G1_ON_to_C10_i57_FF30_G1_ON_IN,
          C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control,
          C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN,
          C2_o36_Not_G1_OK_to_C2_i53_Not_G1_OK,
          C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN,
          C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control,
          C2_o62_AN_ON_to_C10_i76_FF32_Anode_ON_IN,
          // C2_o57_Not_TH_AN_Ready connects to o_EP1_1
          C2_o47_ON_PERM_C10_i63_FF31_Anode_ON_PERM_IN,
          C2_o75_Not_AN_OK_to_C3_i15_AN_PS,
          C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN;

    RPSC_CARD2 card2 (
        .clk(clk), 
        .reset(reset), 
        i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, 
        i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low, 
        .i53_Not_G1_OK(C2_o36_Not_G1_OK_to_C2_i53_Not_G1_OK), 
        .i54_Not_CA_OK(C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK), 
        i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, 
        i46_DC_PS, i45_HV_Connector, i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, 
        i42_Not_OT_AN_Ready, 
        .o19_Not_G1_ON(C2_o19_Not_G1_ON_to_C10_i57_FF30_G1_ON_IN), 
        .o13_Not_Alarm(C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control), 
        .o14_Not_G1_ON_PERM(C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN), 
        .o36_Not_G1_OK(C2_o36_Not_G1_OK_to_C2_i53_Not_G1_OK), 
        .o33_Not_U_G1_Low(C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN), 
        .o39_GR_OK_Modified(o_C2_BJT_39), 
        .o55_Not_Alarm(C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control), 
        .o62_AN_ON(C2_o62_AN_ON_to_C10_i76_FF32_Anode_ON_IN), 
        .o57_Not_TH_AN_Ready(o_EP1_1), 
        .o47_ON_PERM(C2_o47_ON_PERM_C10_i63_FF31_Anode_ON_PERM_IN), 
        .o75_Not_AN_OK(C2_o75_Not_AN_OK_to_C3_i15_AN_PS), 
        .o70_Not_U_AN_Low(C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN), 
        .o78_Not_GR_OK(o_C2_BJT_78)
    );

//------------------------------------------------------------
    RPSC_CARD3 card3 (
        clk, reset, 
        .i15_AN_PS(C2_o75_Not_AN_OK_to_C3_i15_AN_PS), i10_I_AN_High, i9_I_G2_High, i8_DC_PS, i7_U_AN_LOW, 
        i6_Card_POS, i5_Emergency, i4_U_G2_Low, i18_G2_PS_ACT, i32_G_U2_Low, 
        i51_Card_POS, i50_Emergency, i49_DRAC_Overtemp, i59_DR_AMP, o13_Not_Alarm, 
        o14_Not_ON_PERM, o39_Ground_Hold_OK, o19_Not_G2_PS_ON, o36_Not_G2_OK, 
        o33_Not_U_G2_Low, o55_Not_Alarm, o47_Not_ON_PERM, o73_Not_DR_AMP_OK, o62_DR_AMP_ON, o78_GR_OK_Modified;
    );
//------------------------------------------------------------
    RPSC_CARD5 card5 (i11_G2_ok_b, i12_DR_amp_ok_b, i10_ff3, i9_ff4, i8_ff6, i7_ff2, i6_ff1, 
        i50_ff1, i51_ff3, i53_G1_on_b, i54_DR_amp_on_b, i56_CA_on_b, i42_anode_on_b,
        o16_RF_perm_b, o14_RF_perm_b_38in, o13_alarm_b, o47_RF_red_b_27in, o59_RF_red_b) ;
//------------------------------------------------------------

    RPSC_CARD6 card6 (o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm,
    i75_Not_TUNE_OK_Delayed, i74_I_AN_5A, i76_I_AN_6A, i_External,
    .i32_Anode_PS_Control(C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control), 
    .i25_G1_PS_Control(C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control), 
    .i24_G2_PS_Control(), 
    .i34_CA_PS_Control(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control),
    i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control)

//------------------------------------------------------------
    RPSC_CARD7 card7 (clk, reset, i4_FF1_Emergency_IN, 
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
//------------------------------------------------------------
    RPSC_CARD8 card8 (clk, reset,
        i4_FF9_HV_Connector_IN,
        i17_FF10_G1_PS_Local_IN,
        i23_FF11_Anode_PS_Local_IN,
        i37_FF12_Anode_PS_Dummy_IN,
        i43_FF13_G2_PS_Local_IN,
        i57_FF14_I_G2_High_IN,
        i76_FF16_FAN_OFF_Delay_IN,
        o6_FF9_HV_Connector_OUT, o3_FF9_HV_Connector_LA, o9_FF9_HV_Connector_PAMP_Interlock,
        o22_FF11_Anode_PS_Local_LA,
        o39_FF12_Anode_PS_Dummy_LA,
        o42_FF13_G2_PS_Local_LA,
        o59_FF14_I_G2_High_LA,
        o78_FF16_FAN_OFF_Delay_LA);

//------------------------------------------------------------
    RPSC_CARD9 card9 (clk, reset_from_card6_45,
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

//------------------------------------------------------------
    RPSC_CARD10 card10 (clk, reset,
        i4_FF25_FAN_ON_PERM_IN,
        i17_FF26_FAN_ON_IN,
        .i23_FF27_CA_ON_PERM_IN(C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN),
        .i37_FF28_CA_ON_IN(C1_o62_CA_ON_to_C10_i37_FF28_CA_ON_IN),
        .i43_FF29_G1_ON_PERM_IN(C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN),
        .i57_FF30_G1_ON_IN(C2_o19_Not_G1_ON_to_C10_i57_FF30_G1_ON_IN),
        .i63_FF31_Anode_ON_PERM_IN(),
        .i76_FF32_Anode_ON_IN(C2_o62_AN_ON_to_C10_i76_FF32_Anode_ON_IN),
        o3_FF25_FAN_ON_PERM_LA,
        o19_FF26_FAN_ON_LA, o14_FF26_FAN_ON_EP1_39,
        o22_FF27_CA_ON_PERM_LA, 
        o39_FF28_CA_ON_LA, o34_FF28_CA_ON_EP1_40,
        o42_FF29_G1_ON_PERM_LA,
        o59_FF30_G1_ON_LA,
        o62_FF31_Anode_ON_PERM_LA,
        o78_FF32_Anode_ON_LA);

//------------------------------------------------------------
    RPSC_CARD11 card11 (clk, reset,
        .i4_FF33_G2_ON_PERM_IN(),
        .i17_FF34_G2_ON_IN(),
        i23_FF35_DR_AMP_ON_PERM_IN,
        i37_FF36_DR_AMP_ON_IN,
        i43_FF37_RF_Reduced_Permitted_IN,
        i57_FF38_RF_Permitted_IN,
        .i63_FF39_CA_Delay_IN(C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN),
        o3_FF33_G2_ON_PERM_LA,
        o19_FF34_G2_ON_LA,
        o22_FF35_DR_AMP_ON_PERM_LA, 
        o39_FF36_DR_AMP_ON_LA,
        o42_FF37_RF_Reduced_Permitted_LA,
        o59_FF38_RF_Permitted_LA,
        o62_FF39_CA_Delay_LA);

//------------------------------------------------------------
    RPSC_CARD12 card12 (clk, reset_from_card6_45,
        .i4_FF41_U_CA_Low_IN(C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN), 
        .i17_FF42_I_CA_High_IN(C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN),
        .i23_FF43_U_G1_Low_IN(C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN),
        .i37_FF44_U_AN_Low_IN(C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN),
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

//------------------------------------------------------------
    RPSC_CARD18 card18 (i4_Fan_on_b, i5_G1_on_b, i6_CA_on_b,
        i18_G2_on, i19_anode_on, i77_rf_red, i75_rf_perm, i73_an_hv_ready,
        o47_SB_on_b, o42_SB_off_b, o46_hv_on, o45_hv_on, o78_rf_perm, o76_rf_perm, o74_hv_ready);

//------------------------------------------------------------


//------------------------------------------------------------


//------------------------------------------------------------
endmodule