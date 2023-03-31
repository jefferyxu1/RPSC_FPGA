module card2(
    clk, reset, i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, 
    i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low, i53_Not_G1_OK, 
    i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, 
    i46_DC_PS, i45_HV_Connector, i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, 
    i42_Not_OT_AN_Ready, o19_Not_G1_ON, o13_Not_Alarm, o14_Not_G1_ON_PERM, 
    o36_Not_G1_OK, o33_Not_U_G1_Low, o55_Not_Alarm, o62_AN_ON, o57_Not_TH_AN_Ready, 
    o47_ON_PERM, o75_Not_AN_OK, o70_Not_U_AN_Low, o78_Not_GR_OK
);
    input logic clk, reset;
    input logic i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low;
    input logic i53_Not_G1_OK, i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, i46_DC_PS, i45_HV_Connector, 
                i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, i42_Not_OT_AN_Ready;
    output logic o19_Not_G1_ON, o13_Not_Alarm, o14_Not_G1_ON_PERM, o36_Not_G1_OK, o33_Not_U_G1_Low; //o39_GR_OK=i18_G1_PS_ACT
    output logic o55_Not_Alarm, o62_AN_ON, o57_Not_TH_AN_Ready, o47_ON_PERM, o75_Not_AN_OK, o70_Not_U_AN_Low, o78_Not_GR_OK;

    logic Not_G1_ON_PERM, Not_Alarm, SR2s_in, SR2s_out, Not_G1_OK;
    logic Not_Alarm2, Not_TH_AN_Ready, Not_ON_PERM, Node1, SR4s_in, SR4s_out;

    // Schematic card 2 - 1
    assign Not_G1_ON_PERM = i10_Card_POS | i9_Emergency | i8_Door_PAMP | i7_I_G1_High | i6_DC_PS | i5_U_G1_Low;
    assign Not_Alarm = ~Not_G1_ON_PERM;
    assign SR2s_in = i18_G1_PS_ACT & Not_Alarm;
    assign Not_G1_OK = ~ SR2s_out;

    shiftRegister #(.N(128)) check_2_second (.on(SR2s_out), .in(SR2s_in), .clk(clk), .reset(reset));

    assign o19_Not_G1_ON = ~i18_G1_PS_ACT;
    assign o13_Not_Alarm = Not_Alarm;
    assign o14_Not_G1_ON_PERM = Not_G1_ON_PERM;
    assign o36_Not_G1_OK = Not_G1_OK;
    assign o33_Not_U_G1_Low = ~(Not_G1_OK & i32_G_U1_Low);

    // Schematic card 2 - 2
    assign Not_Alarm2 = ~(i51_Door_PAMP | i50_Anode_PS_Fault | i49_Emergency | i48_GR_SW_PAMP | i46_DC_PS | i45_HV_Connector | i44_Card_POS);
    assign TH_AN_Ready = (~i53_Not_G1_OK) & (~i54_Not_CA_OK) & Not_Alarm2;
    assign Not_ON_PERM = i42_Not_OT_AN_Ready & TH_AN_Ready;
    assign Node1 = Not_ON_PERM & i59_AN_PS_ACT;
    assign SR4s_in = ~(i72_U_AN_Low & Node1);

    shiftRegister #(.N(256)) check_4_second (.on(SR4s_out), .in(SR4s_in), .clk(clk), .reset(reset));

    assign o55_Not_Alarm = Not_Alarm2;
    assign o62_AN_ON = ~i59_AN_PS_ACT;
    assign o57_Not_TH_AN_Ready = ~TH_AN_Ready;
    assign o47_ON_PERM = ~Not_ON_PERM;
    assign o75_Not_AN_OK = Node1 & SR4s_out;
    assign o70_Not_U_AN_Low = SR4s_in;
    assign o78_Not_GR_OK = TH_AN_Ready;

endmodule