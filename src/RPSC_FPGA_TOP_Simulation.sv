`timescale 1ns / 1ps
module RPSC_FPGA_TOP_Simulation (
    input logic reset_test,
    input logic sys_clk, 
    input logic i_OT_AN_Ready,
    input logic i_Card_POS,
    input logic i_FAN_ACT,
    input logic i_FAN_ON_PERM,
    input logic i_FAN_OFF_Delay,
    input logic i_Air_Grid,
    input logic i_Air_AN,
    input logic i_Water_Heat_EXCH,
    input logic i_Water_AN,
    input logic i_Door_PAMP,
    input logic i_GR_SW,
    input logic i_HV_Connector,
    input logic i_CA_PS_ACT,
    input logic i_C2_RLY_EM,
    input logic i_C2_RLY_RESET,
    input logic i_LA_TEST,
    input logic i_U_G1_LOW,
    input logic i_U_G2_LOW,
    input logic i_U_AN_LOW,
    input logic i_U_CA_LOW,
    input logic i_I_AN_HIGH_5A,
    input logic i_I_AN_HIGH_6A,
    input logic i_DC_PS_LOW,
    input logic i_I_CA_HIGH,
    input logic i_UART_RX,
    input logic i_Temp_DR_AMP,
    input logic i_DR_AMP,
    input logic i_TUNE_OK_Delayed_BAR,
    input logic i_G2_PS_Internal_Fault,
    input logic i_I_G2_HIGH,
    input logic i_G2_PS_Fault,
    input logic i_G2_PS_Local,
    input logic i_G2_PS_ACT,
    input logic i_AN_PS_Dummy,
    input logic i_I_AN_PS_High,
    input logic i_AN_PS_Fault,
    input logic i_AN_PS_Local,
    input logic i_AN_PS_ACT,
    input logic i_I_G1_High,
    input logic i_G1_PS_OT,
    input logic i_G1_PS_Fault,
    input logic i_G1_PS_Local,
    input logic i_G1_PS_ACT,
    output logic o_TP1,
    output logic o_TP2,
    output logic o_TP3,
    output logic o_TP4,
    output logic o_TP5,
    output logic o_HV_ON_BAR,
    output logic o_HV_OFF_BAR,
    output logic o_ANY_HV_GO_OFF_BAR,
    output logic o_RED_RF_BAR,
    output logic o_FULL_RF_BAR,
    output logic o_HV_Ready_BAR,
    output logic o_ANY_SB_GO_OFF_BAR,
    output logic o_SB_OFF_BAR,
    output logic o_SB_ON_BAR,
    output logic o_TH_AN_Ready,
    output logic o_FAN_ON,
    output logic o_CA_ON,
    output logic o_LA_Emergency,
    output logic o_LA_Card_POS,
    output logic o_LA_Air_Grid,
    output logic o_LA_Air_Anode,
    output logic o_LA_Water_Heat_EXCH,
    output logic o_LA_Water_Anode,
    output logic o_LA_Door_PAMP,
    output logic o_LA_GR_SW_PAMP,
    output logic o_LA_HV_Connector,
    output logic o_LA_G1_PS_TEST,
    output logic o_LA_AN_PS_Local,
    output logic o_LA_Dummy_AN_PS,
    output logic o_LA_G2_PS_TEST,
    output logic o_LA_I_G2_HIGH,
    output logic o_LA_FAN_OFF_Delay,
    output logic o_LA_G1_PS_Fault,
    output logic o_LA_G2_PS_Fault,
    output logic o_C2_RLY_DRAC,
    output logic o_C2_RLY_G2,
    output logic o_C2_RLY_AN,
    output logic o_C2_RLY_G1,
    output logic o_C2_RLY_CA,
    output logic o_LA_U_G2_LOW,
    output logic o_LA_I_AN_HIGH,
    output logic o_LA_U_AN_LOW,
    output logic o_LA_U_G1_LOW,
    output logic o_LA_I_CA_HIGH,
    output logic o_LA_U_CA_LOW,
    output logic o_LA_CA_Delay,
    output logic o_LA_Reduced_RF_PERM,
    output logic o_LA_RF_Reduced,
    output logic o_LA_DR_AMP_ON,
    output logic o_LA_DR_AMP_ON_PERM,
    output logic o_LA_Grid2_ON,
    output logic o_LA_Grid2_ON_PERM,
    output logic o_LA_Anode_ON,
    output logic o_LA_Anode_ON_PERM,
    output logic o_LA_Grid_ON,
    output logic o_LA_Grid_ON_PERM,
    output logic o_LA_Cathode_ON,
    output logic o_LA_Cathode_ON_PERM,
    output logic o_LA_FAN_ON,
    output logic o_LA_FAN_ON_PERM,
    output logic o_LA_G2_PS_Internal_Fault,
    output logic o_LA_G1_PS_OT,
    output logic o_LA_I_G1_HIGH,
    output logic o_LA_AN_PS_OC,
    output logic o_LA_AN_PS_Fault,
    output logic o_LA_TEMP_DR_AMP,
    output logic o_UART_TX,
    output logic o_LA_Alarm,
    output logic o_LA_Control_Voltages,
    output logic o_RF_PERM_BAR,
    output logic o_RF_RED_BAR);



    logic i_OT_AN_Ready_FF,
        i_Card_POS_FF,
        i_FAN_ACT_FF,
        i_FAN_ON_PERM_FF,
        i_FAN_OFF_Delay_FF,
        i_Air_Grid_FF,
        i_Air_AN_FF,
        i_Water_Heat_EXCH_FF,
        i_Water_AN_FF,
        i_Door_PAMP_FF,
        i_GR_SW_FF,
        i_HV_Connector_FF,
        i_CA_PS_ACT_FF,
        i_C2_RLY_EM_FF,
        i_C2_RLY_RESET_FF,
        i_LA_TEST_FF,
        i_U_G1_LOW_FF,
        i_U_G2_LOW_FF,
        i_U_AN_LOW_FF,
        i_U_CA_LOW_FF,
        i_I_AN_HIGH_5A_FF,
        i_I_AN_HIGH_6A_FF,
        i_DC_PS_LOW_FF,
        i_I_CA_HIGH_FF,
        i_UART_RX_FF,
        i_Temp_DR_AMP_FF,
        i_DR_AMP_FF,
        i_TUNE_OK_Delayed_BAR_FF,
        i_G2_PS_Internal_Fault_FF,
        i_I_G2_HIGH_FF,
        i_G2_PS_Fault_FF,
        i_G2_PS_Local_FF,
        i_G2_PS_ACT_FF,
        i_AN_PS_Dummy_FF,
        i_I_AN_PS_High_FF,
        i_AN_PS_Fault_FF,
        i_AN_PS_Local_FF,
        i_AN_PS_ACT_FF,
        i_I_G1_High_FF,
        i_G1_PS_OT_FF,
        i_G1_PS_Fault_FF,
        i_G1_PS_Local_FF,
        i_G1_PS_ACT_FF;

    
    
    // check card1, 2, 3, timer_card18, special_60s_timer test mode
    logic clk;
    clock_divider #(.test_mode(1)) clk_divider (.clk_out(clk), .clk_in(sys_clk), .reset(reset_test));
    
    assign o_UART_TX = i_UART_RX_FF;

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
    inputFF inputFF15 (.clk(clk), .reset(reset_test), .out(i_C2_RLY_RESET_FF), .in(i_C2_RLY_RESET)); // use other pin to substitute reset for now
    inputFF inputFF16 (.clk(clk), .reset(reset_test), .out(i_LA_TEST_FF), .in(i_LA_TEST));
    inputFF inputFF17 (.clk(clk), .reset(reset_test), .out(i_U_G1_LOW_FF), .in(i_U_G1_LOW));
    inputFF inputFF18 (.clk(clk), .reset(reset_test), .out(i_U_G2_LOW_FF), .in(i_U_G2_LOW));
    inputFF inputFF19 (.clk(clk), .reset(reset_test), .out(i_U_AN_LOW_FF), .in(i_U_AN_LOW));
    inputFF inputFF20 (.clk(clk), .reset(reset_test), .out(i_U_CA_LOW_FF), .in(i_U_CA_LOW));
    inputFF inputFF21 (.clk(clk), .reset(reset_test), .out(i_I_AN_HIGH_5A_FF), .in(i_I_AN_HIGH_5A));
    inputFF inputFF22 (.clk(clk), .reset(reset_test), .out(i_I_AN_HIGH_6A_FF), .in(i_I_AN_HIGH_6A));
    inputFF inputFF23 (.clk(clk), .reset(reset_test), .out(i_DC_PS_LOW_FF), .in(i_DC_PS_LOW));
    inputFF inputFF24 (.clk(clk), .reset(reset_test), .out(i_I_CA_HIGH_FF), .in(i_I_CA_HIGH));
    inputFF inputFF25 (.clk(clk), .reset(reset_test), .out(i_UART_RX_FF), .in(i_UART_RX));
    inputFF inputFF26 (.clk(clk), .reset(reset_test), .out(i_Temp_DR_AMP_FF), .in(i_Temp_DR_AMP));
    inputFF inputFF27 (.clk(clk), .reset(reset_test), .out(i_DR_AMP_FF), .in(i_DR_AMP));
    inputFF inputFF28 (.clk(clk), .reset(reset_test), .out(i_TUNE_OK_Delayed_BAR_FF), .in(i_TUNE_OK_Delayed_BAR));
    inputFF inputFF29 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Internal_Fault_FF), .in(i_G2_PS_Internal_Fault));
    inputFF inputFF30 (.clk(clk), .reset(reset_test), .out(i_I_G2_HIGH_FF), .in(i_I_G2_HIGH));
    inputFF inputFF31 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Fault_FF), .in(i_G2_PS_Fault));
    inputFF inputFF32 (.clk(clk), .reset(reset_test), .out(i_G2_PS_Local_FF), .in(i_G2_PS_Local));
    inputFF inputFF33 (.clk(clk), .reset(reset_test), .out(i_G2_PS_ACT_FF), .in(i_G2_PS_ACT));
    inputFF inputFF34 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Dummy_FF), .in(i_AN_PS_Dummy));
    inputFF inputFF35 (.clk(clk), .reset(reset_test), .out(i_I_AN_PS_High_FF), .in(i_I_AN_PS_High));
    inputFF inputFF36 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Fault_FF), .in(i_AN_PS_Fault));
    inputFF inputFF37 (.clk(clk), .reset(reset_test), .out(i_AN_PS_Local_FF), .in(i_AN_PS_Local));
    inputFF inputFF38 (.clk(clk), .reset(reset_test), .out(i_AN_PS_ACT_FF), .in(i_AN_PS_ACT));
    inputFF inputFF39 (.clk(clk), .reset(reset_test), .out(i_I_G1_High_FF), .in(i_I_G1_High));
    inputFF inputFF40 (.clk(clk), .reset(reset_test), .out(i_G1_PS_OT_FF), .in(i_G1_PS_OT));
    inputFF inputFF41 (.clk(clk), .reset(reset_test), .out(i_G1_PS_Fault_FF), .in(i_G1_PS_Fault));
    inputFF inputFF42 (.clk(clk), .reset(reset_test), .out(i_G1_PS_Local_FF), .in(i_G1_PS_Local));
    inputFF inputFF43 (.clk(clk), .reset(reset_test), .out(i_G1_PS_ACT_FF), .in(i_G1_PS_ACT));

    RPSC_Connection #(.test_mode(1)) RPSC_Instantiation (
        // C1
        .clk(clk), .reset(reset_test), .reset_hold_error(i_C2_RLY_RESET_FF), .LA_TEST(i_LA_TEST_FF), 
        .i_EP1_5(i_FAN_ON_PERM_FF), .i_EP1_4(i_FAN_ACT_FF), .i_EP1_37(i_CA_PS_ACT_FF), 
        .i_C14_46_I_CA_High(i_I_CA_HIGH_FF), .i_C14_74_U_CA_Low(i_U_CA_LOW_FF), .o_C1_BJT_78(o_C2_RLY_CA),

        // C2
        .i_EP2_5(i_G1_PS_ACT_FF), /*ACT or Ready*/ .i_C15_22_U_G1_Low(i_U_G1_LOW_FF), .i_C15_74_U_AN_Low(i_U_AN_LOW_FF),
        .i_EP3_5(i_AN_PS_ACT_FF), .i_EP7_2(i_OT_AN_Ready_FF),
        .o_EP7_1(o_TH_AN_Ready), .o_C2_BJT_39(o_C2_RLY_G1), .o_C2_BJT_78(o_C2_RLY_AN),

        // C3
        .i_EP4_5(i_G2_PS_ACT_FF), .i_C15_50_U_G2_Low(i_U_G2_LOW), .i_EP5_5(i_DR_AMP_FF),
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
        .o_LA_Air_Anode(o_LA_Air_Anode), .o_LA_Water_Heat_Exchanger(o_LA_Water_Heat_EXCH),
        .o_LA_Water_Anode(o_LA_Water_Anode), .o_LA_Door_PAMP(o_LA_Door_PAMP), .o_LA_Ground_SW(o_LA_GR_SW_PAMP),

        // C8
        .i_EP1_20(i_HV_Connector_FF), .i_EP2_11(i_G1_PS_Local_FF), .i_EP3_11(i_AN_PS_Local_FF), .i_EP3_24(i_AN_PS_Dummy_FF), 
        .i_EP4_11(i_G2_PS_Local_FF), .i_EP4_14(i_I_G2_HIGH_FF), .i_EP1_6(i_FAN_OFF_Delay_FF),
        .o_LA_HV_Connector(o_LA_HV_Connector), .o_LA_G1_PS_Local(o_LA_G1_PS_TEST), .o_LA_Anode_PS_Local(o_LA_AN_PS_Local), 
        .o_LA_Anode_PS_Dummy(o_LA_Dummy_AN_PS), .o_LA_G2_PS_Local(o_LA_G2_PS_TEST), 
        .o_LA_I_G2_High(o_LA_I_G2_HIGH), .o_LA_FAN_OFF_Delay(o_LA_FAN_OFF_Delay),

        // C9
        .i_EP2_12(i_G1_PS_Fault_FF), .i_EP4_12(i_G2_PS_Fault_FF), .i_EP5_12(i_Temp_DR_AMP_FF), .i_EP3_12(i_AN_PS_Fault_FF), 
        .i_EP3_19(i_I_AN_PS_High_FF), .i_EP2_16(i_I_G1_High_FF), .i_EP2_14(i_G1_PS_OT_FF), .i_EP4_16(i_G2_PS_Internal_Fault_FF),                    
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
        .o_LA_DC_PS_Low(o_LA_Control_Voltages), .o_LA_Alarm(o_LA_Alarm),

        // C18
        .o_EP7_38(o_ANY_SB_GO_OFF_BAR), .o_EP7_42(o_ANY_HV_GO_OFF_BAR), .o_EP7_36(o_SB_ON_BAR), .o_EP7_37(o_SB_OFF_BAR), 
        .o_EP7_44(o_HV_ON_BAR), .o_EP7_43(o_HV_OFF_BAR), .o_EP7_41(o_RED_RF_BAR), .o_EP7_40(o_FULL_RF_BAR), .o_EP7_39(o_HV_Ready_BAR)
    );

        // Used for debugging. Change the signal to the one you want to test
        assign o_TP1 = 1'b0;
        assign o_TP2 = 1'b0;
        assign o_TP3 = 1'b0;
        assign o_TP4 = 1'b0;
        assign o_TP5 = 1'b0;
endmodule


module RPSC_FPGA_TOP_Simulation_testbench();
    logic reset_test;
    logic sys_clk, o_ANY_HV_GO_OFF_BAR, o_ANY_SB_GO_OFF_BAR, i_OT_AN_Ready, i_Card_POS, i_FAN_ACT, i_FAN_ON_PERM, i_FAN_OFF_Delay, i_Air_Grid, i_Air_AN, i_Water_Heat_EXCH, i_Water_AN, i_Door_PAMP, i_GR_SW, i_HV_Connector, i_CA_PS_ACT, i_C2_RLY_EM, i_C2_RLY_RESET, i_LA_TEST, i_U_G1_LOW, i_U_G2_LOW, i_U_AN_LOW, i_U_CA_LOW, i_I_AN_HIGH_5A, i_I_AN_HIGH_6A, i_DC_PS_LOW, i_I_CA_HIGH, i_Temp_DR_AMP, i_DR_AMP, i_TUNE_OK_Delayed_BAR, i_G2_PS_Internal_Fault, i_I_G2_HIGH, i_G2_PS_Fault, i_G2_PS_Local, i_G2_PS_ACT, i_AN_PS_Dummy, i_I_AN_PS_High, i_AN_PS_Fault, i_AN_PS_Local, i_AN_PS_ACT, i_I_G1_High, i_G1_PS_OT, i_G1_PS_Fault, i_G1_PS_Local, i_G1_PS_ACT;

    logic o_LA_Alarm, o_LA_Water_Heat_EXCH, o_HV_ON_BAR, o_HV_OFF_BAR, o_RED_RF_BAR, o_FULL_RF_BAR, o_HV_Ready_BAR, o_SB_OFF_BAR, o_SB_ON_BAR, o_TH_AN_Ready, o_FAN_ON, o_CA_ON, o_LA_FAN_ON, o_LA_FAN_ON_PERM, o_LA_Grid_ON, o_LA_Grid_ON_PERM, o_LA_Cathode_ON, o_LA_Cathode_ON_PERM, o_LA_Anode_ON, o_LA_Anode_ON_PERM, o_LA_Grid2_ON, o_LA_Grid2_ON_PERM, o_LA_DR_AMP_ON, o_LA_DR_AMP_ON_PERM, o_LA_G2_PS_Internal_Fault, o_C2_RLY_DRAC, o_C2_RLY_G2, o_C2_RLY_AN, o_C2_RLY_G1, o_C2_RLY_CA, o_LA_Air_Grid, o_LA_Air_Anode, o_LA_Water_Anode, o_LA_Door_PAMP, o_LA_GR_SW_PAMP, o_LA_HV_Connector, o_LA_TEMP_DR_AMP, o_LA_AN_PS_Fault, o_LA_AN_PS_OC, o_LA_I_G1_HIGH, o_LA_G1_PS_OT, o_LA_U_CA_LOW, o_LA_I_CA_HIGH, o_LA_U_G1_LOW, o_LA_G1_PS_Fault, o_LA_U_AN_LOW, o_LA_I_AN_HIGH, o_LA_U_G2_LOW, o_LA_G2_PS_Fault, o_LA_Card_POS, o_LA_Emergency, o_LA_Control_Voltages, o_LA_Dummy_AN_PS, o_LA_CA_Delay, o_LA_FAN_OFF_Delay, o_LA_G1_PS_TEST, o_LA_G2_PS_TEST, o_LA_I_G2_HIGH, o_LA_AN_PS_Local, o_LA_RF_Reduced, o_LA_Reduced_RF_PERM, o_RF_PERM_BAR, o_RF_RED_BAR;
    
    logic i_UART_RX, o_UART_TX, o_TP1, o_TP2, o_TP3, o_TP4, o_TP5;
    logic clk;
    assign sys_clk = clk;

    RPSC_FPGA_TOP_Simulation dut (.*);

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

    task simulateEverythingCorrect; // Principle: FF has a inversed output. Lamps on the left side should be on. Lamps on the right side should be off
        reset_test <= 1'b1;
        i_C2_RLY_RESET <= 1'b1;
        // Comments may not cover all FF. Some signals affect a lot of FF
        // No FF 15 on C8
        i_OT_AN_Ready <= 1'b0; // Affect FF31 C10 TODO: Check if it has an inverted input
        i_Card_POS <= 1'b1; // FF2 C7
        i_FAN_ACT <= 1'b1; // Goes through an inverter in card 1 then FF26 C10
        i_FAN_ON_PERM <= 1'b1; // Goes through an inverter in card 1 then FF25 C10
        i_FAN_OFF_Delay <= 1'b1; // FF16 C8
        i_Air_Grid <= 1'b1; // FF3 C7
        i_Air_AN <= 1'b1; // FF4 C7
        i_Water_Heat_EXCH <= 1'b1; // FF5 C7
        i_Water_AN <= 1'b1; // FF6 C7
        i_Door_PAMP <= 1'b1; // FF7 C7
        i_GR_SW <= 1'b1; // FF8 C7
        i_HV_Connector <= 1'b1; // FF9 C8
        i_CA_PS_ACT <= 1'b1; // Goes through an inverter in card 1 then FF28 C10 and FF27 C10
        i_C2_RLY_EM <= 1'b1; // FF1 C7
        i_LA_TEST <= 1'b0; // 
        i_U_G1_LOW <= 1'b0; // Affect FF43 C12
        i_U_G2_LOW <= 1'b0; // Affect FF46 C12
        i_U_AN_LOW <= 1'b0; // Affect 4s counter on Card 2
        i_U_CA_LOW <= 1'b0; // Affect FF41 C12
        i_I_AN_HIGH_5A <= 1'b0; // TODO: Check. Analog cards usually output low?
        i_I_AN_HIGH_6A <= 1'b0; // TODO: Check. Analog cards usually output low?
        i_DC_PS_LOW <= 1'b1; // TODO: Check
        i_I_CA_HIGH <= 1'b0; // Affect FF42 C12
        i_Temp_DR_AMP <= 1'b1; // FF19 C9
        i_DR_AMP <= 1'b1; // DR_AMP_ACT, goes to card 3 Pin 59 and affect 
        i_TUNE_OK_Delayed_BAR <= 1'b0; // TODO: Check if inverted // Seems not inverting
        i_G2_PS_Internal_Fault <= 1'b1; // FF24 C9
        i_I_G2_HIGH <= 1'b1; // FF14 C8
        i_G2_PS_Fault <= 1'b1; // FF18 C9
        i_G2_PS_Local <= 1'b1; // FF13 C8
        i_G2_PS_ACT <= 1'b1; // Affect FF34 C11
        i_AN_PS_Dummy <= 1'b0; // FF12 C8 Dummy turns on
        i_I_AN_PS_High <= 1'b1; // FF21 C9
        i_AN_PS_Fault <= 1'b1; // FF20 C9
        i_AN_PS_Local <= 1'b1; // FF11 C8
        i_AN_PS_ACT <= 1'b1; // Affect FF32
        i_I_G1_High <= 1'b1; // FF22 C9
        i_G1_PS_OT <= 1'b1; // FF23 C9
        i_G1_PS_Fault <= 1'b1; // FF17 C9
        i_G1_PS_Local <= 1'b1; // FF10 C8
        i_G1_PS_ACT <= 1'b1; // Affect FF27 C10, FF29 C10, FF30 C10
        i_UART_RX <= 1'b1;
        repeat(5) @(posedge clk); 
        reset_test <= 1'b0;
        repeat(5) @(posedge clk);
        i_C2_RLY_RESET <= 1'b0; 
        repeat(100) @(posedge clk);
    endtask

    // Free to toggle inputs here
    task somethingWrong;
        // i_FAN_ACT <= 1'b0;
        
        // repeat(100) @(posedge clk);
        // i_FAN_ACT <= 1'b1;
        // repeat(100) @(posedge clk);
        // i_G2_PS_Fault <= 1'b0;
        // repeat(10) @(posedge clk);
        // i_C2_RLY_EM <= 1'b0;
        // repeat(10) @(posedge clk);
        // i_G2_PS_Fault <= 1'b0;
        // repeat(10) @(posedge clk);
        // i_G2_PS_Fault <= 1'b1;
        // repeat(50) @(posedge clk);
        // i_C2_RLY_RESET <= 1'b1;
        // repeat(10) @(posedge clk);
        // i_C2_RLY_RESET <= 1'b0;
        // repeat(10) @(posedge clk);
    endtask

    initial begin
        simulateEverythingCorrect;
        somethingWrong;
        $stop;
    end
endmodule
