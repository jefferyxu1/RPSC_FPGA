`timescale 1ns / 1ps
// delete reset_test when compiling for FPGA
module RPSC_FPGA_TOP(sys_clk50, reset_test o_HV_ON_BAR, o_HV_OFF_BAR, o_ANY_HV_GO_OFF_BAR, o_RED_RF_BAR, o_FULL_RF_BAR, o_HV_Ready_BAR, o_ANY_SB_GO_OFF_BAR, o_SB_OFF_BAR, o_SB_ON_BAR, i_OT_AN_Ready, o_TH_AN_Ready, i_Card_POS, i_FAN_ACT, i_FAN_ON_PERM, i_FAN_OFF_Delay, i_Air_Grid, i_Air_AN, i_Water_Heat_EXCH, i_Water_AN, i_Door_PAMP, i_GR_SW, i_HV_Connector, i_CA_PS_ACT, o_FAN_ON, o_CA_ON, o_LA_FAN_ON, o_LA_FAN_ON_PERM, o_LA_Grid_ON, o_LA_Grid_ON_PERM, o_LA_Cathode_ON, o_LA_Cathode_ON_PERM, o_LA_Anode_ON, o_LA_Anode_ON_PERM, o_LA_Grid2_ON, o_LA_Grid2_ON_PERM, o_LA_DR_AMP_ON, o_LA_DR_AMP_ON_PERM, o_LA_G2_PS_Internal_Fault, o_C2_RLY_DRAC, o_C2_RLY_G2, o_C2_RLY_AN, o_C2_RLY_G1, o_C2_RLY_CA, i_C2_RLY_EM, i_C2_RLY_RESET, i_LA_TEST, i_U_G1_LOW, i_U_G2_LOW, i_U_AN_LOW, i_U_CA_LOW, i_I_AN_HIGH_5A, i_I_AN_HIGH_6A, i_DC_PS_LOW, i_I_CA_HIGH, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Air_Water_Anode, o_LA_Door_PAMP, o_LA_GR_SW_PAMP, o_LA_HV_Connector, o_LA_TEMP_DR_AMP, o_LA_AN_PS_Fault, o_LA_AN_PS_OC, o_LA_I_G1_HIGH, o_LA_G1_PS_OT, o_LA_U_CA_LOW, o_LA_I_CA_HIGH, o_LA_U_G1_LOW, o_LA_G1_PS_Fault, o_LA_U_AN_LOW, o_LA_I_AN_HIGH, o_LA_U_G2_LOW, o_LA_G2_PS_Fault, o_LA_Card_POS, o_LA_Emergency, o_LA_Control_Voltages, o_LA_Dummy_AN_PS, o_LA_CA_Delay, o_LA_FAN_OFF_Delay, o_LA_G1_PS_TEST, o_LA_G2_PS_TEST, o_LA_I_G2_HIGH, o_LA_AN_PS_Local, o_LA_RF_Reduced, o_LA_Reduced_RF_PERM, i_Temp_DR_AMP, i_DR_AMP, i_TUNE_OK_Delayed_BAR, o_RF_PERM_BAR, o_RF_RED_BAR, i_G2_PS_Internal_Fault, i_I_G2_HIGH, i_G2_PS_Fault, i_G2_PS_Local, i_G2_PS_ACT, i_AN_PS_Dummy, i_I_AN_PS_OT, i_AN_PS_Fault, i_AN_PS_Local, i_AN_PS_ACT, i_I_G1_High, i_G1_PS_OT, i_G1_PS_Fault, i_G1_PS_Local, i_G1_PS_ACT);
    // comment reset_test when compiling for FPGA
    input logic reset_test;
    input logic sys_clk50, i_OT_AN_Ready, i_Card_POS, i_FAN_ACT, i_FAN_ON_PERM, i_FAN_OFF_Delay, i_Air_Grid, i_Air_AN, i_Water_Heat_EXCH, i_Water_AN, i_Door_PAMP, i_GR_SW, i_HV_Connector, i_CA_PS_ACT, i_C2_RLY_EM, i_C2_RLY_RESET, i_LA_TEST, i_U_G1_LOW, i_U_G2_LOW, i_U_AN_LOW, i_U_CA_LOW, i_I_AN_HIGH_5A, i_I_AN_HIGH_6A, i_DC_PS_LOW, i_I_CA_HIGH, i_Temp_DR_AMP, i_DR_AMP, i_TUNE_OK_Delayed_BAR, i_G2_PS_Internal_Fault, i_I_G2_HIGH, i_G2_PS_Fault, i_G2_PS_Local, i_G2_PS_ACT, i_AN_PS_Dummy, i_I_AN_PS_OT, i_AN_PS_Fault, i_AN_PS_Local, i_AN_PS_ACT, i_I_G1_High, i_G1_PS_OT, i_G1_PS_Fault, i_G1_PS_Local, i_G1_PS_ACT;

    output logic o_HV_ON_BAR, o_HV_OFF_BAR, o_RED_RF_BAR, o_FULL_RF_BAR, o_HV_Ready_BAR, o_SB_OFF_BAR, o_SB_ON_BAR, o_TH_AN_Ready, o_FAN_ON, o_CA_ON, o_LA_FAN_ON, o_LA_FAN_ON_PERM, o_LA_Grid_ON, o_LA_Grid_ON_PERM, o_LA_Cathode_ON, o_LA_Cathode_ON_PERM, o_LA_Anode_ON, o_LA_Anode_ON_PERM, o_LA_Grid2_ON, o_LA_Grid2_ON_PERM, o_LA_DR_AMP_ON, o_LA_DR_AMP_ON_PERM, o_LA_G2_PS_Internal_Fault, o_C2_RLY_DRAC, o_C2_RLY_G2, o_C2_RLY_AN, o_C2_RLY_G1, o_C2_RLY_CA, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Air_Water_Anode, o_LA_Door_PAMP, o_LA_GR_SW_PAMP, o_LA_HV_Connector, o_LA_TEMP_DR_AMP, o_LA_AN_PS_Fault, o_LA_AN_PS_OC, o_LA_I_G1_HIGH, o_LA_G1_PS_OT, o_LA_U_CA_LOW, o_LA_I_CA_HIGH, o_LA_U_G1_LOW, o_LA_G1_PS_Fault, o_LA_U_AN_LOW, o_LA_I_AN_HIGH, o_LA_U_G2_LOW, o_LA_G2_PS_Fault, o_LA_Card_POS, o_LA_Emergency, o_LA_Control_Voltages, o_LA_Dummy_AN_PS, o_LA_CA_Delay, o_LA_FAN_OFF_Delay, o_LA_G1_PS_TEST, o_LA_G2_PS_TEST, o_LA_I_G2_HIGH, o_LA_AN_PS_Local, o_LA_RF_Reduced, o_LA_Reduced_RF_PERM, o_RF_PERM_BAR, o_RF_RED_BAR, o_ANY_HV_GO_OFF_BAR, o_ANY_SB_GO_OFF_BAR;


    logic i_OT_AN_Ready_FF, i_Card_POS_FF, i_FAN_ACT_FF, i_FAN_ON_PERM_FF, i_FAN_OFF_Delay_FF, i_Air_Grid_FF, i_Air_AN_FF, i_Water_Heat_EXCH_FF, i_Water_AN_FF, i_Door_PAMP_FF, i_GR_SW_FF, i_HV_Connector_FF, i_CA_PS_ACT_FF, i_C2_RLY_EM_FF, i_C2_RLY_RESET_FF, i_LA_TEST_FF, i_U_G1_LOW_FF, i_U_G2_LOW_FF, i_U_AN_LOW_FF, i_U_CA_LOW_FF, i_I_AN_HIGH_5A_FF, i_I_AN_HIGH_6A_FF, i_DC_PS_LOW_FF, i_I_CA_HIGH_FF, i_Temp_DR_AMP_FF, i_DR_AMP_FF, i_TUNE_OK_Delayed_BAR_FF, i_G2_PS_Internal_Fault_FF, i_I_G2_HIGH_FF, i_G2_PS_Fault_FF, i_G2_PS_Local_FF, i_G2_PS_ACT_FF, i_AN_PS_Dummy_FF, i_I_AN_PS_OT_FF, i_AN_PS_Fault_FF, i_AN_PS_Local_FF, i_AN_PS_ACT_FF, i_I_G1_High_FF, i_G1_PS_OT_FF, i_G1_PS_Fault_FF, i_G1_PS_Local_FF, i_G1_PS_ACT_FF;

    // comment and uncomment clock related stuff for testbench and FPGA load.
    // check card1, 2, 3, timer_card18, special_60s_timer 
    logic clk;
    //clock_divider clk_divider (.clk_out(clk), .clk_in(sys_clk50), .reset(i_C2_RLY_RESET_FF));
    
    assign clk = sys_clk50; // Uncomment for testbench

    inputFF inputFF1 (.clk(clk), .reset(reset_test), .out(i_OT_AN_Ready_FF), .in(i_OT_AN_Ready));
    inputFF inputFF2 (.clk(clk), .reset(reset_test), .out(i_Card_POS_FF), .in(i_Card_POS));
    inputFF inputFF3 (.clk(clk), .reset(reset_test), .out(i_FAN_ACT_FF), .in(i_FAN_ACT));
    inputFF inputFF4 (.clk(clk), .reset(reset_test), .out(i_FAN_ON_PERM_FF), .in(i_FAN_ON_PERM));
    inputFF inputFF5 (.clk(clk), .reset(reset_test), .out(i_FAN_OFF_Delay_FF), .in(i_FAN_OFF_Delay));
    inputFF inputFF6 (.clk(clk), .reset(reset_test), .out(i_Air_Grid_FF), .in(i_Air_Grid));
    inputFF inputFF7 (.clk(clk), .reset(reset_test), .out(i_Air_AN_FF), .in(i_Air_AN));
    inputFF inputFF8 (.clk(clk), .reset(reset_test), .out(i_Water_Heat_EXCH_FF), .in(i_Water_Heat_EXCH));
    inputFF inputFF9 (.clk(clk), .reset(reset_test), .out(i_Water_AN_FF), .in(i_Water_AN));
    inputFF inputFF10 (.clk(clk), .reset(reset_test), .out(i_Door_PAMP_FF), .in(i_Door_PAMP));
    inputFF inputFF11 (.clk(clk), .reset(reset_test), .out(i_GR_SW_FF), .in(i_GR_SW));
    inputFF inputFF12 (.clk(clk), .reset(reset_test), .out(i_HV_Connector_FF), .in(i_HV_Connector));
    inputFF inputFF13 (.clk(clk), .reset(reset_test), .out(i_CA_PS_ACT_FF), .in(i_CA_PS_ACT));
    inputFF inputFF14 (.clk(clk), .reset(reset_test), .out(i_C2_RLY_EM_FF), .in(i_C2_RLY_EM));
    inputFF inputFF15 (.clk(clk), .reset(1'b0), .out(i_C2_RLY_RESET_FF), .in(i_C2_RLY_RESET));
    inputFF inputFF16 (.clk(clk), .reset(reset_test), .out(i_LA_TEST_FF), .in(i_LA_TEST));
    inputFF inputFF17 (.clk(clk), .reset(reset_test), .out(i_U_G1_LOW_FF), .in(i_U_G1_LOW));
    inputFF inputFF18 (.clk(clk), .reset(reset_test), .out(i_U_G2_LOW_FF), .in(i_U_G2_LOW));
    inputFF inputFF19 (.clk(clk), .reset(reset_test), .out(i_U_AN_LOW_FF), .in(i_U_AN_LOW));
    inputFF inputFF20 (.clk(clk), .reset(reset_test), .out(i_U_CA_LOW_FF), .in(i_U_CA_LOW));
    inputFF inputFF21 (.clk(clk), .reset(reset_test), .out(i_I_AN_HIGH_5A_FF), .in(i_I_AN_HIGH_5A));
    inputFF inputFF22 (.clk(clk), .reset(reset_test), .out(i_I_AN_HIGH_6A_FF), .in(i_I_AN_HIGH_6A));
    inputFF inputFF23 (.clk(clk), .reset(reset_test), .out(i_DC_PS_LOW_FF), .in(i_DC_PS_LOW));
    inputFF inputFF24 (.clk(clk), .reset(reset_test), .out(i_I_CA_HIGH_FF), .in(i_I_CA_HIGH));
    inputFF inputFF25 (.clk(clk), .reset(reset_test), .out(i_Temp_DR_AMP_FF), .in(i_Temp_DR_AMP));
    inputFF inputFF26 (.clk(clk), .reset(reset_test), .out(i_DR_AMP_FF), .in(i_DR_AMP));
    inputFF inputFF27 (.clk(clk), .reset(reset_test), .out(i_TUNE_OK_Delayed_BAR_FF), .in(i_TUNE_OK_Delayed_BAR));
    inputFF inputFF28 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Internal_Fault_FF), .in(i_G2_PS_Internal_Fault));
    inputFF inputFF29 (.clk(clk), .reset(reset_test), .out(i_I_G2_HIGH_FF), .in(i_I_G2_HIGH));
    inputFF inputFF30 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Fault_FF), .in(i_G2_PS_Fault));
    inputFF inputFF31 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Local_FF), .in(i_G2_PS_Local));
    inputFF inputFF32 (.clk(clk), .reset(reset_test), .out(i_G2_PS_ACT_FF), .in(i_G2_PS_ACT));
    inputFF inputFF33 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Dummy_FF), .in(i_AN_PS_Dummy));
    inputFF inputFF34 (.clk(clk), .reset(reset_test), .out(i_I_AN_PS_OT_FF), .in(i_I_AN_PS_OT));
    inputFF inputFF35 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Fault_FF), .in(i_AN_PS_Fault));
    inputFF inputFF36 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Local_FF), .in(i_AN_PS_Local));
    inputFF inputFF37 (.clk(clk), .reset(reset_test), .out(i_AN_PS_ACT_FF), .in(i_AN_PS_ACT));
    inputFF inputFF38 (.clk(clk), .reset(reset_test), .out(i_I_G1_High_FF), .in(i_I_G1_High));
    inputFF inputFF39 (.clk(clk), .reset(reset_test), .out(i_G1_PS_OT_FF), .in(i_G1_PS_OT));
    inputFF inputFF40 (.clk(clk), .reset(reset_test), .out(i_G1_PS_Fault_FF), .in(i_G1_PS_Fault));
    inputFF inputFF41 (.clk(clk), .reset(reset_test), .out(i_G1_PS_Local_FF), .in(i_G1_PS_Local));
    inputFF inputFF42 (.clk(clk), .reset(reset_test), .out(i_G1_PS_ACT_FF), .in(i_G1_PS_ACT));

    RPSC_Connection RPSC_Instantiation (
        // C1
        .clk(clk), .reset(i_C2_RLY_RESET_FF), .reset_hold_error(i_C2_RLY_RESET_FF), .LA_TEST(i_LA_TEST_FF), 
        .i_EP1_5(i_FAN_ON_PERM_FF), .i_EP1_4(i_FAN_ACT_FF), .i_EP1_37(i_CA_PS_ACT_FF), 
        .i_C14_46_I_CA_High(i_I_CA_HIGH_FF), .i_C14_74_U_CA_Low(i_U_CA_LOW_FF), .o_C1_BJT_78(o_C2_RLY_CA),

        // C2
        .i_EP2_5(i_G1_PS_ACT_FF), /*ACT or Ready*/ .i_C15_22_U_G1_Low(i_U_G1_LOW_FF), .i_C15_74_U_AN_Low(i_U_AN_LOW_FF),
        .i_EP3_5(i_AN_PS_ACT_FF), .i_EP7_2(i_OT_AN_Ready_FF),
        .o_EP7_1(o_TH_AN_Ready), .o_C2_BJT_39(o_C2_RLY_G1), .o_C2_BJT_78(o_C2_RLY_AN),

        // C3
        .i_EP4_5(i_G2_PS_ACT_FF), .i_C15_50_U_G2_Low(i_U_G2_LOW)/*TODO: is it high or low*/, .i_EP5_5(i_DR_AMP_FF),
        .o_C3_BJT_39(o_C2_RLY_G2), .o_C3_BJT_78(o_C2_RLY_DRAC),

        // C5
        .o_EP6_4(o_RF_PERM_BAR), .o_EP6_5(o_RF_RED_BAR),

        // C6
        .i_C6_External(i_C2_RLY_EM_FF), .i_EP6_3(i_TUNE_OK_Delayed_BAR_FF), 
        .i_C16_22_I_AN_High_5A(i_I_AN_HIGH_5A_FF), .i_C16_46_I_AN_High_6A(i_I_AN_HIGH_6A_FF),

        // C7
        .i_EP1_10(i_Air_Grid_FF), .i_EP1_11(i_Air_AN_FF), .i_EP1_14(i_Water_Heat_EXCH_FF), .i_EP1_15(i_Water_AN_FF), 
        .i_EP1_18(i_Door_PAMP_FF), .i_EP1_19(i_GR_SW_FF), .i_Card_POS(i_Card_POS_FF),
        .o_LA_Emergency(o_LA_Emergency), .o_LA_Card_POS(o_LA_Card_POS), .o_LA_Air_Grid(o_LA_Air_Grid), 
        .o_LA_Air_Anode(o_LA_Air_Anode), .o_LA_Water_Heat_Exchanger(), // Won't need water heat exchanger
        .o_LA_Water_Anode(o_LA_Air_Water_Anode), .o_LA_Door_PAMP(o_LA_Door_PAMP), .o_LA_Ground_SW(o_LA_GR_SW_PAMP),

        // C8
        .i_EP1_20(i_HV_Connector_FF), .i_EP2_11(i_G1_PS_Local_FF), .i_EP3_11(i_AN_PS_Local_FF), .i_EP3_24(i_AN_PS_Dummy_FF), 
        .i_EP4_11(i_G2_PS_Local_FF), .i_EP4_14(i_I_G2_HIGH_FF), .i_EP1_6(i_FAN_OFF_Delay_FF),
        .o_LA_HV_Connector(o_LA_HV_Connector), .o_LA_G1_PS_Local(o_LA_G1_PS_TEST), .o_LA_Anode_PS_Local(o_LA_AN_PS_Local), 
        .o_LA_Anode_PS_Dummy(o_LA_Dummy_AN_PS), .o_LA_G2_PS_Local(o_LA_G2_PS_TEST), 
        .o_LA_I_G2_High(o_LA_I_G2_HIGH), .o_LA_FAN_OFF_Delay(o_LA_FAN_OFF_Delay),

        // C9
        .i_EP2_12(i_G1_PS_Fault_FF), .i_EP4_12(i_G2_PS_Fault_FF), .i_EP5_12(i_Temp_DR_AMP_FF), .i_EP3_12(i_AN_PS_Fault_FF), 
        .i_EP3_19(i_I_AN_PS_OT_FF), .i_EP2_16(i_I_G1_High_FF), .i_EP2_14(i_G1_PS_OT_FF), .i_EP4_16(i_G2_PS_Internal_Fault_FF),                    
        .o_LA_G1_PS_Fault(o_LA_G1_PS_Fault), .o_LA_G2_PS_Fault(o_LA_G2_PS_Fault), .o_LA_TEMP_DR_AMP(o_LA_TEMP_DR_AMP), 
        .o_LA_Anode_PS_Fault(o_LA_AN_PS_Fault), .o_LA_AN_PS_Over_Current(o_LA_AN_PS_OC),
        .o_LA_I_G1_High(o_LA_I_G1_HIGH), .o_LA_G1_PS_Over_Temp(o_LA_G1_PS_OT), .o_LA_G2_PS_Internal_Fault(o_LA_G2_PS_Internal_Fault),

        // C10
        .o_LA_FAN_ON_PERM(o_LA_FAN_ON_PERM), .o_LA_FAN_ON(o_LA_FAN_ON), .o_EP1_39(o_FAN_ON), 
        .o_LA_CA_PS_ON_PERM(o_LA_Cathode_ON_PERM), .o_LA_CA_PS_ON(o_LA_Cathode_ON), .o_EP1_40(o_CA_ON), 
        .o_LA_G1_PS_ON_PERM(o_LA_Grid_ON_PERM), .o_LA_G1_PS_ON(o_LA_Grid_ON), 
        .o_LA_Anode_PS_ON_PERM(o_LA_Anode_ON_PERM), .o_LA_Anode_PS_ON(o_LA_Anode_ON),

        // C11
        .o_LA_G2_ON_PERM(o_LA_Grid2_ON_PERM), .o_LA_G2_ON(o_LA_Grid2_ON), 
        .o_LA_DR_AMP_ON_PERM(o_LA_DR_AMP_ON_PERM), .o_LA_DR_AMP_ON(o_LA_DR_AMP_ON), 
        .o_LA_RF_Reduced_PERM(o_LA_RF_Reduced), .o_LA_RF_Permitted(o_LA_Reduced_RF_PERM), // Should be correct order now
        .o_LA_CA_Delay(o_LA_CA_Delay),

        // C12
        .i_C16_74_DC_PS_Low(i_DC_PS_LOW_FF),
        .o_LA_U_CA_Low(o_LA_U_CA_LOW), .o_LA_I_CA_High(o_LA_I_CA_HIGH), .o_LA_U_G1_Low(o_LA_U_G1_LOW), 
        .o_LA_U_AN_Low(o_LA_U_AN_LOW), .o_LA_I_AN_High(o_LA_I_AN_HIGH), .o_LA_U_G2_Low(o_LA_U_G2_LOW), 
        .o_LA_DC_PS_Low(o_LA_Control_Voltages), .o_LA_Alarm(), // Alarm lamp doesn't exist

        // C18
        .o_EP7_38(o_ANY_SB_GO_OFF_BAR), .o_EP7_42(o_ANY_HV_GO_OFF_BAR), .o_EP7_36(o_SB_ON_BAR), .o_EP7_37(o_SB_OFF_BAR), 
        .o_EP7_44(o_HV_ON_BAR), .o_EP7_43(o_HV_OFF_BAR), .o_EP7_41(o_RED_RF_BAR), .o_EP7_40(o_FULL_RF_BAR), .o_EP7_39(o_HV_Ready_BAR)
    );

endmodule

module RPSC_FPGA_TOP_testbench();
    logic reset_test;
    logic sys_clk50, o_ANY_HV_GO_OFF_BAR, o_ANY_SB_GO_OFF_BAR, i_OT_AN_Ready, i_Card_POS, i_FAN_ACT, i_FAN_ON_PERM, i_FAN_OFF_Delay, i_Air_Grid, i_Air_AN, i_Water_Heat_EXCH, i_Water_AN, i_Door_PAMP, i_GR_SW, i_HV_Connector, i_CA_PS_ACT, i_C2_RLY_EM, i_C2_RLY_RESET, i_LA_TEST, i_U_G1_LOW, i_U_G2_LOW, i_U_AN_LOW, i_U_CA_LOW, i_I_AN_HIGH_5A, i_I_AN_HIGH_6A, i_DC_PS_LOW, i_I_CA_HIGH, i_Temp_DR_AMP, i_DR_AMP, i_TUNE_OK_Delayed_BAR, i_G2_PS_Internal_Fault, i_I_G2_HIGH, i_G2_PS_Fault, i_G2_PS_Local, i_G2_PS_ACT, i_AN_PS_Dummy, i_I_AN_PS_OT, i_AN_PS_Fault, i_AN_PS_Local, i_AN_PS_ACT, i_I_G1_High, i_G1_PS_OT, i_G1_PS_Fault, i_G1_PS_Local, i_G1_PS_ACT;

    logic o_HV_ON_BAR, o_HV_OFF_BAR, o_RED_RF_BAR, o_FULL_RF_BAR, o_HV_Ready_BAR, o_SB_OFF_BAR, o_SB_ON_BAR, o_TH_AN_Ready, o_FAN_ON, o_CA_ON, o_LA_FAN_ON, o_LA_FAN_ON_PERM, o_LA_Grid_ON, o_LA_Grid_ON_PERM, o_LA_Cathode_ON, o_LA_Cathode_ON_PERM, o_LA_Anode_ON, o_LA_Anode_ON_PERM, o_LA_Grid2_ON, o_LA_Grid2_ON_PERM, o_LA_DR_AMP_ON, o_LA_DR_AMP_ON_PERM, o_LA_G2_PS_Internal_Fault, o_C2_RLY_DRAC, o_C2_RLY_G2, o_C2_RLY_AN, o_C2_RLY_G1, o_C2_RLY_CA, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Air_Water_Anode, o_LA_Door_PAMP, o_LA_GR_SW_PAMP, o_LA_HV_Connector, o_LA_TEMP_DR_AMP, o_LA_AN_PS_Fault, o_LA_AN_PS_OC, o_LA_I_G1_HIGH, o_LA_G1_PS_OT, o_LA_U_CA_LOW, o_LA_I_CA_HIGH, o_LA_U_G1_LOW, o_LA_G1_PS_Fault, o_LA_U_AN_LOW, o_LA_I_AN_HIGH, o_LA_U_G2_LOW, o_LA_G2_PS_Fault, o_LA_Card_POS, o_LA_Emergency, o_LA_Control_Voltages, o_LA_Dummy_AN_PS, o_LA_CA_Delay, o_LA_FAN_OFF_Delay, o_LA_G1_PS_TEST, o_LA_G2_PS_TEST, o_LA_I_G2_HIGH, o_LA_AN_PS_Local, o_LA_RF_Reduced, o_LA_Reduced_RF_PERM, o_RF_PERM_BAR, o_RF_RED_BAR;
    
    logic clk, reset;
    assign sys_clk50 = clk;

    RPSC_FPGA_TOP dut (.*);

    parameter CLOCK_PERIOD = 1000;
    logic [31:0] i; // labeling case number
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    always_ff @(posedge clk) begin
        if (i_C2_RLY_RESET) i <= 0;
        else i <= i + 1;
    end

    task simulateNoLampOn; // Principle: FF receives 0 means there is a problem. FF has a inversed output. FF outputs 1 indicates there is a problem. 
        reset_test <= 1'b1;
        i_C2_RLY_RESET <= 1'b1;

        // No FF 15 on C8
        i_OT_AN_Ready <= 1'b
        i_Card_POS <= 1'b1; // FF2 C7
        i_FAN_ACT <= 1'b0; // Goes through an inverter in card 1 then FF26 C10 TODO: Should lamps on the left on or off?
        i_FAN_ON_PERM <= 1'b0; // Goes through an inverter in card 1 then FF25 C10
        i_FAN_OFF_Delay <= 1'b1; // FF16 C8
        i_Air_Grid <= 1'b1; // FF3 C7
        i_Air_AN <= 1'b1; // FF4 C7
        i_Water_Heat_EXCH <= 1'b1; // FF5 C7
        i_Water_AN <= 1'b1; // FF6 C7
        i_Door_PAMP <= 1'b1; // FF7 C7
        i_GR_SW <= 1'b1; // FF8 C7
        i_HV_Connector <= 1'b1; // FF9 C8
        i_CA_PS_ACT <= 1'b0; // Goes through an inverter in card 1 then FF28 C10 
        i_C2_RLY_EM <= 1'b1; // FF1 C7
        i_LA_TEST <= 1'b
        i_U_G1_LOW <= 1'b
        i_U_G2_LOW <= 1'b
        i_U_AN_LOW <= 1'b
        i_U_CA_LOW <= 1'b
        i_I_AN_HIGH_5A <= 1'b
        i_I_AN_HIGH_6A <= 1'b
        i_DC_PS_LOW <= 1'b
        i_I_CA_HIGH <= 1'b
        i_Temp_DR_AMP <= 1'b1; // FF19 C9
        i_DR_AMP <= 1'b
        i_TUNE_OK_Delayed_BAR <= 1'b
        i_G2_PS_Internal_Fault <= 1'b1; // FF24 C9
        i_I_G2_HIGH <= 1'b1; // FF14 C8
        i_G2_PS_Fault <= 1'b1; // FF18 C9
        i_G2_PS_Local <= 1'b1; // FF13 C8
        i_G2_PS_ACT <= 1'b
        i_AN_PS_Dummy <= 1'b1; // FF12 C8
        i_I_AN_PS_OT <= 1'b1; // FF21 C9
        i_AN_PS_Fault <= 1'b1; // FF20 C9
        i_AN_PS_Local <= 1'b1; // FF11 C8
        i_AN_PS_ACT <= 1'b
        i_I_G1_High <= 1'b1; // FF22 C9
        i_G1_PS_OT <= 1'b1; // FF23 C9
        i_G1_PS_Fault <= 1'b1; // FF17 C9
        i_G1_PS_Local <= 1'b1; // FF10 C8
        i_G1_PS_ACT <= 1'b
        
        @(posedge clk);
        i_C2_RLY_RESET <= 1'b0; reset_test <= 1'b0; @(posedge clk);
        @(posedge clk);
    endtask

    initial begin
        simulateNoLampOn;
        $stop;
    end
endmodule
