module RPSC_Connection(clk, reset, reset_hold_error, LA_TEST, 
                i_EP1_5, i_EP1_4, i_EP1_37, i_C14_46_I_CA_High, i_C14_74_U_CA_Low,
                o_C1_BJT_78,

                i_EP2_5, i_C15_22_U_G1_Low, i_C15_74_U_AN_Low, i_EP3_5, i_EP7_2,
                o_EP7_1, o_C2_BJT_39, o_C2_BJT_78,

                i_EP4_5, i_C15_50_U_G2_Low, i_EP5_5,
                o_C3_BJT_39, o_C3_BJT_78,

                o_EP6_4, o_EP6_5,

                i_C6_External, i_EP6_3, i_C16_22_I_AN_High_5A, i_C16_46_I_AN_High_6A,

                i_EP1_10, i_EP1_11, i_EP1_14, i_EP1_15, i_EP1_18, i_EP1_19, i_Card_POS,
                o_LA_Emergency, o_LA_Card_POS, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Water_Heat_Exchanger, 
                o_LA_Water_Anode, o_LA_Door_PAMP, o_LA_Ground_SW,

                i_EP1_20, i_EP2_11, i_EP3_11, i_EP3_24, i_EP4_11, i_EP4_14, i_EP1_6,
                o_LA_HV_Connector, o_LA_G1_PS_Local, o_LA_Anode_PS_Local, o_LA_Anode_PS_Dummy, o_LA_G2_PS_Local, 
                o_LA_I_G2_High, o_LA_FAN_OFF_Delay,

                i_EP2_12, i_EP4_12, i_EP5_12, i_EP3_12, i_EP3_19, i_EP2_16, i_EP2_14, i_EP4_16,                    
                o_LA_G1_PS_Fault, o_LA_I_G2_High, o_LA_TEMP_DR_AMP, o_LA_Anode_PS_Fault, o_LA_AN_PS_Over_Current,
                o_LA_I_G1_High, o_LA_G1_PS_Over_Temp, o_LA_G2_PS_Internal_Fault,

                o_LA_FAN_ON_PERM, o_LA_FAN_ON, o_EP1_39, o_LA_CA_PS_ON_PERM, o_LA_CA_PS_ON, o_EP1_40, 
                o_LA_G1_PS_ON_PERM, o_LA_G1_PS_ON, o_LA_Anode_PS_ON_PERM, o_LA_Anode_PS_ON,

                o_LA_G2_ON_PERM, o_LA_G2_ON, o_LA_DR_AMP_ON_PERM, o_LA_DR_AMP_ON, o_LA_RF_Reduced_PERM,
                o_LA_RF_Permitted, o_LA_CA_Delay,

                i_C16_74_DC_PS_Low,
                o_LA_U_CA_Low, o_LA_I_CA_High, o_LA_U_G1_Low, o_LA_U_AN_Low, o_LA_I_AN_High, o_LA_U_G2_Low,
                o_LA_DC_PS_Low, o_LA_Alarm,

                i_EP7_38, i_EP7_42,
                o_EP7_36, o_EP7_37, o_EP7_44, o_EP7_43, o_EP7_41, o_EP7_40, o_EP7_39
    );

    // Naming Convention 
    // input/output examples: i_EP1_1, o_EP1_2
    // if EP is not a real IO, then EP1_3
    // Interconnecting different cards: C1_o55_Not_Alarm_to_C1_i48_Water_Grid, direction: output to input

    // general
    input logic clk, reset, reset_hold_error;
    // lamp test
    input logic LA_TEST;
    // Card 1
    input logic i_EP1_5, i_EP1_4, i_EP1_37, i_C14_46_I_CA_High, i_C14_74_U_CA_Low;
    output logic o_C1_BJT_78;
    // card 2
    // TODO: EP3-5 should also connects to RF Main Control, figure out with bypass FPGA
    input logic i_EP2_5, i_C15_22_U_G1_Low, i_C15_74_U_AN_Low, i_EP3_5, i_EP7_2;
    output logic o_EP7_1, o_C2_BJT_39, o_C2_BJT_78;
    // card 3
    // TODO: EP5-5: Is PS ACT same as DR AMP ACT?
    input logic i_EP4_5, i_C15_50_U_G2_Low, i_EP5_5;
    output logic o_C3_BJT_39, o_C3_BJT_78;
    // card 5
    output logic o_EP6_4, o_EP6_5;
    // card 6
    input logic i_C6_External, i_EP6_3, i_C16_22_I_AN_High_5A, i_C16_46_I_AN_High_6A;
    // card 7
    input logic i_EP1_10, i_EP1_11, i_EP1_14, i_EP1_15, i_EP1_18, i_EP1_19, i_Card_POS;
    output logic o_LA_Emergency, o_LA_Card_POS, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Water_Heat_Exchanger, 
                    o_LA_Water_Anode, o_LA_Door_PAMP, o_LA_Ground_SW;
    // card 8
    input logic i_EP1_20, i_EP2_11, i_EP3_11, i_EP3_24, i_EP4_11, i_EP4_14, i_EP1_6;
    output logic o_LA_HV_Connector, o_LA_G1_PS_Local, o_LA_Anode_PS_Local, o_LA_Anode_PS_Dummy, o_LA_G2_PS_Local, 
                    o_LA_I_G2_High, o_LA_FAN_OFF_Delay;
    // card 9
    input logic i_EP2_12, i_EP4_12, i_EP5_12, i_EP3_12, i_EP3_19, i_EP2_16, i_EP2_14, i_EP4_16;                    
    output logic o_LA_G1_PS_Fault, o_LA_G2_PS_Fault, o_LA_TEMP_DR_AMP, o_LA_Anode_PS_Fault, o_LA_AN_PS_Over_Current,
                    o_LA_I_G1_High, o_LA_G1_PS_Over_Temp, o_LA_G2_PS_Internal_Fault;
    // card 10
    output logic o_LA_FAN_ON_PERM, o_LA_FAN_ON, o_EP1_39, o_LA_CA_PS_ON_PERM, o_LA_CA_PS_ON, o_EP1_40, 
                    o_LA_G1_PS_ON_PERM, o_LA_G1_PS_ON, o_LA_Anode_PS_ON_PERM, o_LA_Anode_PS_ON;
    // card 11
    output logic o_LA_G2_ON_PERM, o_LA_G2_ON, o_LA_DR_AMP_ON_PERM, o_LA_DR_AMP_ON, o_LA_RF_Reduced_PERM,
                    o_LA_RF_Permitted, o_LA_CA_Delay;
    // card 12
    input logic i_C16_74_DC_PS_Low;
    output logic o_LA_U_CA_Low, o_LA_I_CA_High, o_LA_U_G1_Low, o_LA_U_AN_Low, o_LA_I_AN_High, o_LA_U_G2_Low,
                    o_LA_DC_PS_Low, o_LA_Alarm;
    // card 18
    input logic i_EP7_38, i_EP7_42;
    output logic o_EP7_36, o_EP7_37, o_EP7_44, o_EP7_43, o_EP7_41, o_EP7_40, o_EP7_39;

    
// ------------------------------------------------------
    // wire originate from this card declares here
    logic C1_o19_FAN_ON_to_C1_i54_C10_i17_C18_i4_FAN_ON,
          C1_o14_FAN_ON_PERM_to_C10_i4_FF25_FAN_ON_PERM_IN,
          C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control,
          C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN,
          C1_o62_CA_ON_to_C5_i56_C10_i37_C18_i6_CA_ON,
          C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN,
          C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK,
          C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN,
          C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN;


    RPSC_CARD1 card1 (
        .o19_FAN_ON(C1_o19_FAN_ON_to_C1_i54_C10_i17_C18_i4_FAN_ON), 
        .o14_FAN_ON_PERM(C1_o14_FAN_ON_PERM_to_C10_i4_FF25_FAN_ON_PERM_IN),
        .o55_Not_Alarm(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control), 
        .o47_CA_ON_PERM(C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN), 
        .o62_CA_ON(C1_o62_CA_ON_to_C5_i56_C10_i37_C18_i6_CA_ON),
        .o74_CA_Delay(C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN), 
        .o75_Not_CA_OK(C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK),
        .o70_I_CA_High(C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN), 
        .o77_U_CA_Low(C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN), 
        .o78_Modified(o_C1_BJT_78),
        .clk(clk), 
        .reset(reset), 
        .i17_FAN_ON_PERM(i_EP1_5),
        .i18_FAN_ACT(i_EP1_18),
        .i54_FAN_ON(C1_o19_FAN_ON_to_C1_i54_C10_i17_C18_i4_FAN_ON), 
        .i53_Not_G1_OK(C2_o36_Not_G1_OK_to_C1_i53_C2_i53_C5_i53_G1_OK), 
        .i59_CA_PS_ACT(i_EP1_37),  
        .i51_Card_POS(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i50_Air_Grid(C7_o25_FF3_Air_Grid_OUT_to_C1_i50_C5_i10_C5_i51_Air_Grid),
        .i49_Water_Anode(C7_o55_FF6_Water_Anode_OUT_to_C1_49_C5_8_Water_Anode), 
        .i48_Water_Grid(C7_o45_FF5_Water_Heat_Exchanger_OUT_C1_i48_Water_Grid), 
        .i46_DC_PS(C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS),
        .i45_U_CA_Low(C12_o6_FF41_U_CA_Low_OUT_to_C1_i45_U_CA_Low), 
        .i44_I_CA_High(C12_o15_FF42_I_CA_High_OUT_to_C1_i44_I_CA_High), 
        .i72_I_CA_High(i_C14_46_I_CA_High), 
        .i76_U_CA_Low(i_C14_74_U_CA_Low));


//----------------------------------------------------------
    logic C2_o19_Not_G1_ON_to_C10_i57_C18_i5_G1_ON,
          C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control,
          C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN,
          C2_o36_Not_G1_OK_to_C1_i53_C2_i53_C5_i53_G1_OK,
          C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN,
          C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control,
          C2_o62_AN_ON_to_C5_i42_C10_i76_C18_i19_Anode_ON,
          // C2_o57_Not_TH_AN_Ready connects to o_EP1_1
          C2_o47_ON_PERM_C10_i63_C18_i73_Anode_ON_PERM,
          C2_o75_Not_AN_OK_to_C3_i15_AN_PS,
          C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN;

    RPSC_CARD2 card2 (
        .clk(clk), 
        .reset(reset), 
        .i10_Card_POS(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i9_Emergency(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i8_Door_PAMP(C7_o65_FF7_Door_PAMP_OUT_to_C2_i8_C2_i51_Door_PAMP), 
        .i7_I_G1_High(C9_o6_FF17_G1_PS_Fault_OUT_to_C2_i7_I_G1_High), 
        .i6_DC_PS(C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS), 
        .i5_U_G1_Low(C12_o25_FF43_U_G1_Low_OUT_to_C2_i5_U_G1_Low), 
        .i18_G1_PS_ACT(i_EP2_5), 
        .i32_G_U1_Low(i_C15_22_U_G1_Low), 
        .i53_Not_G1_OK(C2_o36_Not_G1_OK_to_C1_i53_C2_i53_C5_i53_G1_OK), 
        .i54_Not_CA_OK(C1_o75_Not_CA_OK_to_C2_i54_Not_CA_OK), 
        .i51_Door_PAMP(C7_o65_FF7_Door_PAMP_OUT_to_C2_i8_C2_i51_Door_PAMP), 
        .i50_Anode_PS_Fault(C9_o35_FF20_AN_PS_Fault_OUT_to_C2_i50_Anode_PS_Fault), 
        .i49_Emergency(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i48_GR_SW_PAMP(C7_o74_FF8_GR_SW_OUT_to_C2_i48_GR_SW_PAMP), 
        .i46_DC_PS(C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS), 
        .i45_HV_Connector(C8_o6_FF9_HV_Connector_OUT_to_C2_i45_HV_Connector), 
        .i44_Card_POS(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i72_U_AN_Low(i_C15_74_U_AN_Low), 
        .i59_AN_PS_ACT(i_EP3_5), 
        .i42_Not_OT_AN_Ready(i_EP7_2), 
        .o19_Not_G1_ON(C2_o19_Not_G1_ON_to_C10_i57_C18_i5_G1_ON), 
        .o13_Not_Alarm(C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control), 
        .o14_Not_G1_ON_PERM(C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN), 
        .o36_Not_G1_OK(C2_o36_Not_G1_OK_to_C1_i53_C2_i53_C5_i53_G1_OK), 
        .o33_Not_U_G1_Low(C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN), 
        .o39_GR_OK_Modified(o_C2_BJT_39), 
        .o55_Not_Alarm(C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control), 
        .o62_AN_ON(C2_o62_AN_ON_to_C5_i42_C10_i76_C18_i19_Anode_ON), 
        .o57_Not_TH_AN_Ready(o_EP7_1), 
        .o47_ON_PERM(C2_o47_ON_PERM_C10_i63_C18_i73_Anode_ON_PERM), 
        .o75_Not_AN_OK(C2_o75_Not_AN_OK_to_C3_i15_AN_PS), 
        .o70_Not_U_AN_Low(C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN), 
        .o78_Not_GR_OK(o_C2_BJT_78));

//------------------------------------------------------------
    logic C3_o13_Not_Alarm_to_C6_i24_G2_PS_Control,
          C3_o14_Not_ON_PERM_to_C11_i4_FF33_G2_ON_PERM_IN,
          C3_o19_Not_G2_PS_ON_to_C11_i17_C18_i18_G2_ON,
          C3_o36_Not_G2_OK_to_C5_i11_Not_G2_OK,
          C3_o33_Not_U_G2_Low_to_C12_i57_FF46_U_G2_Low_IN,
          C3_o55_Not_Alarm_to_C6_i36_DR_AMP_Control,
          C3_o47_Not_ON_PERM_to_C11_i23_FF35_DR_AMP_ON_PERM_IN,
          C3_o73_Not_DR_AMP_OK_to_C5_i12_i54_Not_DR_AMP_OK,
          C3_o62_DR_AMP_ON_to_C11_i37_C18_i3_DR_AMP_ON;

    RPSC_CARD3 card3 (
        .clk(clk), 
        .reset(reset), 
        .i15_AN_PS(C2_o75_Not_AN_OK_to_C3_i15_AN_PS), 
        .i10_I_AN_High(C12_o45_FF45_I_AN_High_OUT_to_C3_i10_I_AN_High), 
        .i9_I_G2_High(C9_o15_FF18_G2_PS_Fault_OUT_to_C3_i9_I_G2_High), 
        .i8_DC_PS(C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS), 
        .i7_U_AN_Low(C12_o35_FF44_U_AN_Low_OUT_to_C3_i7_U_AN_Low), 
        .i6_Card_POS(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i5_Emergency(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i4_U_G2_Low(C12_o55_FF46_U_G2_Low_OUT_to_C3_i4_U_G2_Low), 
        .i18_G2_PS_ACT(i_EP4_5), 
        .i32_G_U2_Low(i_C15_50_U_G2_Low), 
        .i51_Card_POS(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i50_Emergency(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i49_DRAC_Overtemp(C9_o25_FF19_Temp_DR_AMP_OUT_to_C3_i49_DRAC_Overtemp), 
        .i59_DR_AMP(i_EP5_5), 
        .o13_Not_Alarm(C3_o13_Not_Alarm_to_C6_i24_G2_PS_Control), 
        .o14_Not_ON_PERM(C3_o14_Not_ON_PERM_to_C11_i4_FF33_G2_ON_PERM_IN), 
        .o39_Ground_Hold_OK(o_C3_BJT_39), 
        .o19_Not_G2_PS_ON(C3_o19_Not_G2_PS_ON_to_C11_i17_C18_i18_G2_ON), 
        .o36_Not_G2_OK(C3_o36_Not_G2_OK_to_C5_i11_Not_G2_OK), 
        .o33_Not_U_G2_Low(C3_o33_Not_U_G2_Low_to_C12_i57_FF46_U_G2_Low_IN), 
        .o55_Not_Alarm(C3_o55_Not_Alarm_to_C6_i36_DR_AMP_Control), 
        .o47_Not_ON_PERM(C3_o47_Not_ON_PERM_to_C11_i23_FF35_DR_AMP_ON_PERM_IN), 
        .o73_Not_DR_AMP_OK(C3_o73_Not_DR_AMP_OK_to_C5_i12_i54_Not_DR_AMP_OK), 
        .o62_DR_AMP_ON(C3_o62_DR_AMP_ON_to_C11_i37_C18_i3_DR_AMP_ON), 
        .o78_GR_OK_Modified(o_C3_BJT_78));
//------------------------------------------------------------
    logic C5_o14_FF38_to_C11_i57_C18_i75_RF_PERM,
          C5_o13_Not_Alarm_to_C6_i37_RF_PERMIT_TED_Control,
          C5_o47_FF37_to_C11_i43_C18_i77_RF_Reduced_Permitted;

    RPSC_CARD5 card5 (
        .i11_Not_G2_OK(C3_o36_Not_G2_OK_to_C5_i11_Not_G2_OK), 
        .i12_Not_DR_AMP_OK(C3_o73_Not_DR_AMP_OK_to_C5_i12_i54_Not_DR_AMP_OK), 
        .i10_FF3(C7_o25_FF3_Air_Grid_OUT_to_C1_i50_C5_i10_C5_i51_Air_Grid), 
        .i9_FF4(C7_o35_FF4_Air_Anode_OUT_to_C5_i9_FF4), 
        .i8_FF6(C7_o55_FF6_Water_Anode_OUT_to_C1_49_C5_8_Water_Anode), 
        .i7_FF2(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .i6_FF1(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i50_FF1(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .i51_FF3(C7_o25_FF3_Air_Grid_OUT_to_C1_i50_C5_i10_C5_i51_Air_Grid),
        .i53_Not_G1_OK(C2_o36_Not_G1_OK_to_C1_i53_C2_i53_C5_i53_G1_OK), 
        .i54_Not_DR_AMP_OK(C3_o73_Not_DR_AMP_OK_to_C5_i12_i54_Not_DR_AMP_OK), 
        .i56_Not_CA_ON(C1_o62_CA_ON_to_C5_i56_C10_i37_C18_i6_CA_ON), 
        .i42_Not_Anode_ON(C2_o62_AN_ON_to_C5_i42_C10_i76_C18_i19_Anode_ON),
        .o16_Not_RF_PERM(o_EP6_4), 
        .o14_FF38(C5_o14_FF38_to_C11_i57_C18_i75_RF_PERM), 
        .o13_Not_Alarm(C5_o13_Not_Alarm_to_C6_i37_RF_PERMIT_TED_Control), 
        .o47_FF37(C5_o47_FF37_to_C11_i43_C18_i77_RF_Reduced_Permitted), 
        .o59_Not_RF_RED(o_EP6_5));
//------------------------------------------------------------
    logic C6_o77_I_AN_HIGH_to_C12_i43_FF45_I_AN_High_IN,
          C6_o47_Emergency_to_C7_i4_FF1_Emergency_IN,
          C6_o38_Not_Alarm_to_C12_i76_FF48_Alarm_IN;

    RPSC_CARD6 card6 (
        .i_External(i_C6_External),
        .i32_Anode_PS_Control(C2_o55_Not_Alarm_to_C6_i32_Anode_PS_Control), 
        .i25_G1_PS_Control(C2_o13_Not_Alarm_to_C6_i25_G1_PS_Control), 
        .i24_G2_PS_Control(C3_o13_Not_Alarm_to_C6_i24_G2_PS_Control), 
        .i34_CA_PS_Control(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control),
        .i36_DR_AMP_Control(C3_o55_Not_Alarm_to_C6_i36_DR_AMP_Control), 
        .i37_RF_PERMIT_TED_Control(C5_o13_Not_Alarm_to_C6_i37_RF_PERMIT_TED_Control),
        .i75_Not_TUNE_OK_Delayed(i_EP6_3), 
        .i74_I_AN_5A(i_C16_22_I_AN_High_5A), 
        .i76_I_AN_6A(i_C16_46_I_AN_High_6A),
        .o77_I_AN_HIGH(C6_o77_I_AN_HIGH_to_C12_i43_FF45_I_AN_High_IN), 
        .o47_Emergency(C6_o47_Emergency_to_C7_i4_FF1_Emergency_IN), 
        .o38_Not_Alarm(C6_o38_Not_Alarm_to_C12_i76_FF48_Alarm_IN));

//------------------------------------------------------------
    logic C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency,
          C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS,
          C7_o25_FF3_Air_Grid_OUT_to_C1_i50_C5_i10_C5_i51_Air_Grid,
          C7_o35_FF4_Air_Anode_OUT_to_C5_i9_FF4,
          C7_o45_FF5_Water_Heat_Exchanger_OUT_C1_i48_Water_Grid,
          C7_o55_FF6_Water_Anode_OUT_to_C1_49_C5_8_Water_Anode,
          C7_o65_FF7_Door_PAMP_OUT_to_C2_i8_C2_i51_Door_PAMP,
          C7_o74_FF8_GR_SW_OUT_to_C2_i48_GR_SW_PAMP;

    RPSC_CARD7 card7 (
        .clk(clk), 
        .reset(reset), 
        .LA_Test(LA_TEST),
        .i4_FF1_Emergency_IN(C6_o47_Emergency_to_C7_i4_FF1_Emergency_IN), 
        .i17_FF2_Card_POS_IN(i_Card_POS), // from analog card to make sure all cards are connected
        .i23_FF3_Air_Grid_IN(i_EP1_10), 
        .i37_FF4_Air_Anode_IN(i_EP1_11), 
        .i43_FF5_Water_Heat_Exchanger_IN(i_EP1_14), 
        .i57_FF6_Water_Anode_IN(i_EP1_15), 
        .i63_FF7_Door_PAMP_IN(i_EP1_18), 
        .i76_FF8_GR_SW_IN(i_EP1_19),
        .o6_FF1_Emergency_OUT(C7_o6_FF1_Emergency_OUT_to_C2_i9_C2_i49_C3_i5_C3_i50_C5_i6_C5_i50_Emergency), 
        .o3_FF1_Emergency_LA(o_LA_Emergency),
        .o15_FF2_Card_POS_OUT(C7_o15_FF2_Card_POS_OUT_to_C1_i51_C2_i10_C2_i44_C3_i6_C3_i51_C5_i7_Card_POS), 
        .o19_FF2_Card_POS_LA(o_LA_Card_POS),
        .o25_FF3_Air_Grid_OUT(C7_o25_FF3_Air_Grid_OUT_to_C1_i50_C5_i10_C5_i51_Air_Grid), 
        .o22_FF3_Air_Grid_LA(o_LA_Air_Grid),
        .o35_FF4_Air_Anode_OUT(C7_o35_FF4_Air_Anode_OUT_to_C5_i9_FF4), 
        .o39_FF4_Air_Anode_LA(o_LA_Air_Anode),
        .o45_FF5_Water_Heat_Exchanger_OUT(C7_o45_FF5_Water_Heat_Exchanger_OUT_C1_i48_Water_Grid),
        .o42_FF5_Water_Heat_Exchanger_LA(o_LA_Water_Heat_Exchanger),
        .o55_FF6_Water_Anode_OUT(C7_o55_FF6_Water_Anode_OUT_to_C1_49_C5_8_Water_Anode), 
        .o59_FF6_Water_Anode_LA(o_LA_Water_Anode),
        .o65_FF7_Door_PAMP_OUT(C7_o65_FF7_Door_PAMP_OUT_to_C2_i8_C2_i51_Door_PAMP), 
        .o62_FF7_Door_PAMP_LA(o_LA_Door_PAMP),
        .o74_FF8_GR_SW_OUT(C7_o74_FF8_GR_SW_OUT_to_C2_i48_GR_SW_PAMP), 
        .o78_FF8_GR_SW_LA(o_LA_Ground_SW));
//------------------------------------------------------------
    logic C8_o6_FF9_HV_Connector_OUT_to_C2_i45_HV_Connector;
    
    RPSC_CARD8 card8 (
        .clk(clk), 
        .reset(reset),
        .LA_Test(LA_TEST),
        .i4_FF9_HV_Connector_IN(i_EP1_20),
        .i17_FF10_G1_PS_Local_IN(i_EP2_11),
        .i23_FF11_Anode_PS_Local_IN(i_EP3_11),
        .i37_FF12_Anode_PS_Dummy_IN(i_EP3_24),
        .i43_FF13_G2_PS_Local_IN(i_EP4_11),
        .i57_FF14_I_G2_High_IN(i_EP4_14),
        .i76_FF16_FAN_OFF_Delay_IN(i_EP1_6),
        .o6_FF9_HV_Connector_OUT(C8_o6_FF9_HV_Connector_OUT_to_C2_i45_HV_Connector),
        .o3_FF9_HV_Connector_LA(o_LA_HV_Connector),
        .o19_FF10_G1_PS_Local_LA(o_LA_G1_PS_Local),
        .o22_FF11_Anode_PS_Local_LA(o_LA_Anode_PS_Local),
        .o39_FF12_Anode_PS_Dummy_LA(o_LA_Anode_PS_Dummy),
        .o42_FF13_G2_PS_Local_LA(o_LA_G2_PS_Local),
        .o59_FF14_I_G2_High_LA(o_LA_I_G2_High),
        .o78_FF16_FAN_OFF_Delay_LA(o_LA_FAN_OFF_Delay));

//------------------------------------------------------------
    logic C9_o6_FF17_G1_PS_Fault_OUT_to_C2_i7_I_G1_High,
          C9_o15_FF18_G2_PS_Fault_OUT_to_C3_i9_I_G2_High,
          C9_o25_FF19_Temp_DR_AMP_OUT_to_C3_i49_DRAC_Overtemp,
          C9_o35_FF20_AN_PS_Fault_OUT_to_C2_i50_Anode_PS_Fault;

    RPSC_CARD9 card9 (
        .clk(clk), 
        .reset(reset),
        .LA_Test(LA_TEST),
        .i4_FF17_G1_PS_Fault_IN(i_EP2_12), 
        .i17_FF18_G2_PS_Fault_IN(i_EP4_12),
        .i23_FF19_Temp_DR_AMP_IN(i_EP5_12),
        .i37_FF20_AN_PS_Fault_IN(i_EP3_12),
        .i43_FF21_AN_PS_Over_Current_IN(i_EP3_19),
        .i57_FF22_I_G1_High_IN(i_EP2_16),
        .i63_FF23_G1_PS_Over_Temp_IN(i_EP2_14),
        .i76_FF24_G2_PS_Internal_Fault_IN(i_EP4_16),
        .o6_FF17_G1_PS_Fault_OUT(C9_o6_FF17_G1_PS_Fault_OUT_to_C2_i7_I_G1_High), 
        .o3_FF17_G1_PS_Fault_LA(o_LA_G1_PS_Fault),
        .o15_FF18_G2_PS_Fault_OUT(C9_o15_FF18_G2_PS_Fault_OUT_to_C3_i9_I_G2_High), 
        .o19_FF18_G2_PS_Fault_LA(o_LA_I_G2_High),
        .o25_FF19_Temp_DR_AMP_OUT(C9_o25_FF19_Temp_DR_AMP_OUT_to_C3_i49_DRAC_Overtemp), 
        .o22_FF19_Temp_DR_AMP_LA(o_LA_TEMP_DR_AMP),
        .o35_FF20_AN_PS_Fault_OUT(C9_o35_FF20_AN_PS_Fault_OUT_to_C2_i50_Anode_PS_Fault), 
        .o39_FF20_AN_PS_Fault_LA(o_LA_Anode_PS_Fault),
        .o42_FF21_AN_PS_Over_Current_LA(o_LA_AN_PS_Over_Current),
        .o59_FF22_I_G1_High_LA(o_LA_I_G1_High),
        .o62_FF23_G1_PS_Over_Temp_LA(o_LA_G1_PS_Over_Temp),
        .o78_FF24_G2_PS_Internal_Fault_LA(o_LA_G2_PS_Internal_Fault));

//------------------------------------------------------------
    RPSC_CARD10 card10 (
        .clk(clk), 
        .reset(reset),
        .LA_Test(LA_TEST),
        .i4_FF25_FAN_ON_PERM_IN(C1_o14_FAN_ON_PERM_to_C10_i4_FF25_FAN_ON_PERM_IN),
        .i17_FF26_FAN_ON_IN(C1_o19_FAN_ON_to_C1_i54_C10_i17_C18_i4_FAN_ON),
        .i23_FF27_CA_ON_PERM_IN(C1_o47_CA_ON_PERM_to_C10_i23_FF27_CA_ON_PERM_IN),
        .i37_FF28_CA_ON_IN(C1_o62_CA_ON_to_C5_i56_C10_i37_C18_i6_CA_ON),
        .i43_FF29_G1_ON_PERM_IN(C2_o14_Not_G1_ON_PERM_to_C10_i43_FF29_G1_ON_PERM_IN),
        .i57_FF30_G1_ON_IN(C2_o19_Not_G1_ON_to_C10_i57_C18_i5_G1_ON),
        .i63_FF31_Anode_ON_PERM_IN(C2_o47_ON_PERM_C10_i63_C18_i73_Anode_ON_PERM),
        .i76_FF32_Anode_ON_IN(C2_o62_AN_ON_to_C5_i42_C10_i76_C18_i19_Anode_ON),
        .o3_FF25_FAN_ON_PERM_LA(o_LA_FAN_ON_PERM),
        .o19_FF26_FAN_ON_LA(o_LA_FAN_ON), 
        .o14_FF26_FAN_ON_EP1_39(o_EP1_39),
        .o22_FF27_CA_ON_PERM_LA(o_LA_CA_PS_ON_PERM), 
        .o39_FF28_CA_ON_LA(o_LA_CA_PS_ON), 
        .o34_FF28_CA_ON_EP1_40(o_EP1_40),
        .o42_FF29_G1_ON_PERM_LA(o_LA_G1_PS_ON_PERM),
        .o59_FF30_G1_ON_LA(o_LA_G1_PS_ON),
        .o62_FF31_Anode_ON_PERM_LA(o_LA_Anode_PS_ON_PERM),
        .o78_FF32_Anode_ON_LA(o_LA_Anode_PS_ON));

//------------------------------------------------------------
    RPSC_CARD11 card11 (
        .clk(clk), 
        .reset(reset),
        .LA_Test(LA_TEST),
        .i4_FF33_G2_ON_PERM_IN(C3_o14_Not_ON_PERM_to_C11_i4_FF33_G2_ON_PERM_IN),
        .i17_FF34_G2_ON_IN(C3_o19_Not_G2_PS_ON_to_C11_i17_C18_i18_G2_ON),
        .i23_FF35_DR_AMP_ON_PERM_IN(C3_o47_Not_ON_PERM_to_C11_i23_FF35_DR_AMP_ON_PERM_IN),
        .i37_FF36_DR_AMP_ON_IN(C3_o62_DR_AMP_ON_to_C11_i37_C18_i3_DR_AMP_ON),
        .i43_FF37_RF_Reduced_Permitted_IN(C5_o47_FF37_to_C11_i43_C18_i77_RF_Reduced_Permitted),
        .i57_FF38_RF_Permitted_IN(C5_o14_FF38_to_C11_i57_C18_i75_RF_PERM),
        .i63_FF39_CA_Delay_IN(C1_o74_CA_Delay_to_C11_i63_FF39_CA_Delay_IN),
        .o3_FF33_G2_ON_PERM_LA(o_LA_G2_ON_PERM),
        .o19_FF34_G2_ON_LA(o_LA_G2_ON),
        .o22_FF35_DR_AMP_ON_PERM_LA(o_LA_DR_AMP_ON_PERM), 
        .o39_FF36_DR_AMP_ON_LA(o_LA_DR_AMP_ON),
        .o42_FF37_RF_Reduced_Permitted_LA(o_LA_RF_Reduced_PERM),
        .o59_FF38_RF_Permitted_LA(o_LA_RF_Permitted),
        .o62_FF39_CA_Delay_LA(o_LA_CA_Delay));

//------------------------------------------------------------
    logic C12_o6_FF41_U_CA_Low_OUT_to_C1_i45_U_CA_Low,
          C12_o15_FF42_I_CA_High_OUT_to_C1_i44_I_CA_High,
          C12_o25_FF43_U_G1_Low_OUT_to_C2_i5_U_G1_Low,
          C12_o35_FF44_U_AN_Low_OUT_to_C3_i7_U_AN_Low,
          C12_o45_FF45_I_AN_High_OUT_to_C3_i10_I_AN_High,
          C12_o55_FF46_U_G2_Low_OUT_to_C3_i4_U_G2_Low,
          C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS;


    RPSC_CARD12 card12 (
        .clk(clk), 
        .reset(reset),
        .LA_Test(LA_TEST),
        .i4_FF41_U_CA_Low_IN(C1_o77_U_CA_Low_to_C12_i4_FF41_U_CA_Low_IN), 
        .i17_FF42_I_CA_High_IN(C1_o70_I_CA_High_to_C12_i17_FF42_I_CA_High_IN),
        .i23_FF43_U_G1_Low_IN(C2_o33_Not_U_G1_Low_to_C12_i23_FF43_U_G1_Low_IN),
        .i37_FF44_U_AN_Low_IN(C2_o70_Not_U_AN_Low_to_C12_i37_FF44_U_AN_Low_IN),
        .i43_FF45_I_AN_High_IN(C6_o77_I_AN_HIGH_to_C12_i43_FF45_I_AN_High_IN),
        .i57_FF46_U_G2_Low_IN(C3_o33_Not_U_G2_Low_to_C12_i57_FF46_U_G2_Low_IN),
        .i63_FF47_DC_PS_Low_IN(i_C16_74_DC_PS_Low),
        .i76_FF48_Alarm_IN(C6_o38_Not_Alarm_to_C12_i76_FF48_Alarm_IN),
        .o6_FF41_U_CA_Low_OUT(C12_o6_FF41_U_CA_Low_OUT_to_C1_i45_U_CA_Low), 
        .o3_FF41_U_CA_Low_LA(o_LA_U_CA_Low),
        .o15_FF42_I_CA_High_OUT(C12_o15_FF42_I_CA_High_OUT_to_C1_i44_I_CA_High), 
        .o19_FF42_I_CA_High_LA(o_LA_I_CA_High),
        .o25_FF43_U_G1_Low_OUT(C12_o25_FF43_U_G1_Low_OUT_to_C2_i5_U_G1_Low), 
        .o22_FF43_U_G1_Low_LA(o_LA_U_G1_Low),
        .o35_FF44_U_AN_Low_OUT(C12_o35_FF44_U_AN_Low_OUT_to_C3_i7_U_AN_Low), 
        .o39_FF44_U_AN_Low_LA(o_LA_U_AN_Low),
        .o45_FF45_I_AN_High_OUT(C12_o45_FF45_I_AN_High_OUT_to_C3_i10_I_AN_High), 
        .o42_FF45_I_AN_High_LA(o_LA_I_AN_High),
        .o55_FF46_U_G2_Low_OUT(C12_o55_FF46_U_G2_Low_OUT_to_C3_i4_U_G2_Low), 
        .o59_FF46_U_G2_Low_LA(o_LA_U_G2_Low),
        .o65_FF47_DC_PS_Low_OUT(C12_o65_FF47_DC_PS_Low_OUT_to_C1_i46_C2_i6_C2_i46_C3_i8_DC_PS), 
        .o62_FF47_DC_PS_Low_LA(o_LA_DC_PS_Low),
        .o78_FF48_Alarm_LA(o_LA_Alarm));

//------------------------------------------------------------
    RPSC_CARD18 card18 (
        .i3_Not_DR_AMP_ON(C3_o62_DR_AMP_ON_to_C11_i37_C18_i3_DR_AMP_ON), 
        .i4_Not_FAN_ON(C1_o19_FAN_ON_to_C1_i54_C10_i17_C18_i4_FAN_ON), 
        .i5_Not_G1_ON(C2_o19_Not_G1_ON_to_C10_i57_C18_i5_G1_ON), 
        .i6_Not_CA_ON(C1_o62_CA_ON_to_C5_i56_C10_i37_C18_i6_CA_ON),
        .i12_Not_ANY_SB_GO_OFF(i_EP7_38),
        .i34_Not_ANY_HV_GO_OFF(i_EP7_42),
        .i18_Not_G2_ON(C3_o19_Not_G2_PS_ON_to_C11_i17_C18_i18_G2_ON), 
        .i19_Not_Anode_ON(C2_o62_AN_ON_to_C5_i42_C10_i76_C18_i19_Anode_ON), 
        .i77_Not_RF_RED(C5_o47_FF37_to_C11_i43_C18_i77_RF_Reduced_Permitted), 
        .i75_Not_RF_PERM(C5_o14_FF38_to_C11_i57_C18_i75_RF_PERM), 
        .i73_Not_AN_HV_Ready(C2_o47_ON_PERM_C10_i63_C18_i73_Anode_ON_PERM),
        .o47_Not_SB_ON(o_EP7_36), 
        .o42_Not_SB_OFF(o_EP7_37), 
        .o46_Not_HV_ON(o_EP7_44), 
        .o45_Not_HV_ON(o_EP7_43), 
        .o78_Not_RF_PERM(o_EP7_41), 
        .o76_Not_RF_PERM(o_EP7_40), 
        .o74_Not_HV_Ready(o_EP7_39));

//------------------------------------------------------------

endmodule

module RPSC_Connection_testbench ();

    logic clk, reset, reset_hold_error, LA_TEST, 
                i_EP1_5, i_EP1_4, i_EP1_37, i_C14_46_I_CA_High, i_C14_74_U_CA_Low,
                o_C1_BJT_78,

                i_EP2_5, i_C15_22_U_G1_Low, i_C15_74_U_AN_Low, i_EP3_5, i_EP7_2,
                o_EP7_1, o_C2_BJT_39, o_C2_BJT_78,

                i_EP4_5, i_C15_50_U_G2_Low, i_EP5_5,
                o_C3_BJT_39, o_C3_BJT_78,

                o_EP6_4, o_EP6_5,

                i_C6_External, i_EP6_3, i_C16_22_I_AN_High_5A, i_C16_46_I_AN_High_6A,

                i_EP1_10, i_EP1_11, i_EP1_14, i_EP1_15, i_EP1_18, i_EP1_19, i_Card_POS,
                o_LA_Emergency, o_LA_Card_POS, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Water_Heat_Exchanger, 
                o_LA_Water_Anode, o_LA_Door_PAMP, o_LA_Ground_SW,

                i_EP1_20, i_EP2_11, i_EP3_11, i_EP3_24, i_EP4_11, i_EP4_14, i_EP1_6,
                o_LA_HV_Connector, o_LA_G1_PS_Local, o_LA_Anode_PS_Local, o_LA_Anode_PS_Dummy, o_LA_G2_PS_Local, 
                o_LA_I_G2_High, o_LA_FAN_OFF_Delay,

                i_EP2_12, i_EP4_12, i_EP5_12, i_EP3_12, i_EP3_19, i_EP2_16, i_EP2_14, i_EP4_16,                    
                o_LA_G1_PS_Fault, o_LA_G2_PS_Fault, o_LA_TEMP_DR_AMP, o_LA_Anode_PS_Fault, o_LA_AN_PS_Over_Current,
                o_LA_I_G1_High, o_LA_G1_PS_Over_Temp, o_LA_G2_PS_Internal_Fault,

                o_LA_FAN_ON_PERM, o_LA_FAN_ON, o_EP1_39, o_LA_CA_PS_ON_PERM, o_LA_CA_PS_ON, o_EP1_40, 
                o_LA_G1_PS_ON_PERM, o_LA_G1_PS_ON, o_LA_Anode_PS_ON_PERM, o_LA_Anode_PS_ON,

                o_LA_G2_ON_PERM, o_LA_G2_ON, o_LA_DR_AMP_ON_PERM, o_LA_DR_AMP_ON, o_LA_RF_Reduced_PERM,
                o_LA_RF_Permitted, o_LA_CA_Delay,

                i_C16_74_DC_PS_Low,
                o_LA_U_CA_Low, o_LA_I_CA_High, o_LA_U_G1_Low, o_LA_U_AN_Low, o_LA_I_AN_High, o_LA_U_G2_Low,
                o_LA_DC_PS_Low, o_LA_Alarm,

                i_EP7_38, i_EP7_42,
                o_EP7_36, o_EP7_37, o_EP7_44, o_EP7_43, o_EP7_41, o_EP7_40, o_EP7_39;

    RPSC_Connection dut (.*);

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; reset_hold_error <= 1'b1; @(posedge clk);
        reset <= 1'b0; reset_hold_error <= 1'b0; @(posedge clk);
        @(posedge clk);
        $stop;
    end

endmodule