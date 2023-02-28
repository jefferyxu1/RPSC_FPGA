module card6 (o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm,
    i75_Not_TUNE_OK_Delayed, i74_I_AN_5A, i76_I_AN_6A, i_External,
    i32_Anode_PS_Control, i25_G1_PS_Control, i24_G2_PS_Control, i34_CA_PS_Control,
    i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control
);

    output logic o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm;
    input logic i75_Not_TUNE_OK_Delayed, i74_I_AN_5A, i76_I_AN_6A, i_External,
    i32_Anode_PS_Control, i25_G1_PS_Control, i24_G2_PS_Control, i34_CA_PS_Control,
    i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control;

    assign o77_I_AN_HIGH = ~((i75_Not_TUNE_OK_Delayed & i74_I_AN_5A) | (~i75_Not_TUNE_OK_Delayed & i76_I_AN_6A));
    assign o47_Emergency = i_External;
    assign o38_Not_Alarm = ~(i32_Anode_PS_Control | i25_G1_PS_Control | i24_G2_PS_Control | i34_CA_PS_Control | 
        i36_DR_AMP_Control | i37_RF_PERMIT_TED_Control);

endmodule
    
