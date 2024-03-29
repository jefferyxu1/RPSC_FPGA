module RPSC_CARD6 (o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm,
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
    assign o38_Not_Alarm = i32_Anode_PS_Control & i25_G1_PS_Control & i24_G2_PS_Control & i34_CA_PS_Control & 
        i36_DR_AMP_Control & i37_RF_PERMIT_TED_Control;

endmodule
    

module RPSC_CARD6_testbench();
    logic o77_I_AN_HIGH, o47_Emergency, o38_Not_Alarm;
    logic i75_Not_TUNE_OK_Delayed, i74_I_AN_5A, i76_I_AN_6A, i_External,
    i32_Anode_PS_Control, i25_G1_PS_Control, i24_G2_PS_Control, i34_CA_PS_Control,
    i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control;

    RPSC_CARD6 dut (.*);

    parameter CLOCK_PERIOD = 100;
    integer i;
    
    initial begin
        i = 0;
        {i32_Anode_PS_Control, i25_G1_PS_Control, i24_G2_PS_Control, i34_CA_PS_Control,
            i36_DR_AMP_Control, i37_RF_PERMIT_TED_Control} = 6'b1;
        i_External = 1'b0;

        for(int j = 0; j < 8; j++) begin 
            {i74_I_AN_5A, i75_Not_TUNE_OK_Delayed, i76_I_AN_6A} = j; // Excauste combinations
            #1000;
        end
        #1000;
        $stop;
    end
endmodule