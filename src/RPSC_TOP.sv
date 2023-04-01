module RPSC_TOP(clk, reset);

    // Naming Convention 
    // input/output examples: i_EP1_1, o_EP1_2
    // if EP is not a real IO, then EP1_3
    // Interconnecting different cards: C1_o55_Not_Alarm_to_C1_i48_Water_Grid, direction: output to input
    input logic clk, reset;
    input logic 


// ------------------------------------------------------
    // wire originate from this card declares here
    logic C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control, C1


    RPSC_CARD1 card1 (.o55_Not_Alarm(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control), 
    .o47_CA_ON_PERM(), o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified,
    clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low)


//----------------------------------------------------------

    RPSC_CARD6 card6 (o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm,
    i75_Not_TUNE_OK_Delayed, i74_I_AN_5A, i76_I_AN_6A, i_External,
    i32_Anode_PS_Control, i25_G1_PS_Control, i24_G2_PS_Control, 
    .i34_CA_PS_Control(C1_o55_Not_Alarm_to_C6_i34_CA_PS_Control),
    i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control)

//
endmodule