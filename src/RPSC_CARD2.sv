module RPSC_CARD2(
    clk, reset, i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, 
    i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low, i53_Not_G1_OK, 
    i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, 
    i46_DC_PS, i45_HV_Connector, i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, 
    i42_Not_OT_AN_Ready, o19_Not_G1_ON, o13_Not_Alarm, o14_Not_G1_ON_PERM, 
    o36_Not_G1_OK, o33_Not_U_G1_Low, o39_GR_OK_Modified, o55_Not_Alarm, o62_AN_ON, o57_Not_TH_AN_Ready, 
    o47_ON_PERM, o75_Not_AN_OK, o70_Not_U_AN_Low, o78_Not_GR_OK
);
    input logic clk, reset;
    input logic i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low;
    input logic i53_Not_G1_OK, i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, i46_DC_PS, i45_HV_Connector, 
                i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, i42_Not_OT_AN_Ready;
    output logic o19_Not_G1_ON, o13_Not_Alarm, o14_Not_G1_ON_PERM, o36_Not_G1_OK, o33_Not_U_G1_Low, o39_GR_OK_Modified;
    output logic o55_Not_Alarm, o62_AN_ON, o57_Not_TH_AN_Ready, o47_ON_PERM, o75_Not_AN_OK, o70_Not_U_AN_Low, o78_Not_GR_OK;

    logic Not_G1_ON_PERM, Not_Alarm, TM2s_in, TM2s_out, Not_G1_OK;
    logic Not_Alarm2, TH_AN_Ready, Not_ON_PERM, Node1, TM4s_in, TM4s_out;

    // Schematic card 2 - 1
    assign Not_G1_ON_PERM = i10_Card_POS | i9_Emergency | i8_Door_PAMP | i7_I_G1_High | i6_DC_PS | i5_U_G1_Low;
    assign Not_Alarm = ~Not_G1_ON_PERM;
    assign TM2s_in = i18_G1_PS_ACT & Not_Alarm;
    assign Not_G1_OK = ~TM2s_out;

    // 2 second timer when clk period is 1.28us
    // timer #(.WIDTH(21)) timer2s (.clk(clk), .reset(reset), .target(21'd1562500), .in(TM2s_in), .hit_target(TM2s_out));
    timer #(.WIDTH(4)) timer2s_test (.clk(clk), .reset(reset), .target(4'd8), .in(TM2s_in), .hit_target(TM2s_out));

    assign o19_Not_G1_ON = ~i18_G1_PS_ACT;
    assign o13_Not_Alarm = Not_Alarm;
    assign o14_Not_G1_ON_PERM = ~i18_G1_PS_ACT;
    assign o36_Not_G1_OK = Not_G1_OK;
    assign o33_Not_U_G1_Low = ~(TM2s_out & i32_G_U1_Low);
    assign o39_GR_OK_Modified = i18_G1_PS_ACT;

    // Schematic card 2 - 2
    assign Not_Alarm2 = ~(i51_Door_PAMP | i50_Anode_PS_Fault | i49_Emergency | i48_GR_SW_PAMP | i46_DC_PS | i45_HV_Connector | i44_Card_POS);
    assign TH_AN_Ready = (~i53_Not_G1_OK) & (~i54_Not_CA_OK) & Not_Alarm2;
    assign Not_ON_PERM = i42_Not_OT_AN_Ready & TH_AN_Ready;
    assign Node1 = Not_ON_PERM & i59_AN_PS_ACT;
    assign TM4s_in = i72_U_AN_Low & Node1;

    // when clk period is 1.28us
    // timer #(.WIDTH(22)) timer4s (.clk(clk), .reset(reset), .target(22'd3125000), .in(TM4s_in), .hit_target(TM4s_out));
    timer #(.WIDTH(4)) timer4s_test (.clk(clk), .reset(reset), .target(4'd15), .in(TM4s_in), .hit_target(TM4s_out));

    assign o55_Not_Alarm = Not_Alarm2;
    assign o62_AN_ON = ~i59_AN_PS_ACT;
    assign o57_Not_TH_AN_Ready = ~TH_AN_Ready;
    assign o47_ON_PERM = ~Not_ON_PERM;
    assign o75_Not_AN_OK = Node1 & TM4s_out;
    assign o70_Not_U_AN_Low = ~TM4s_in;
    assign o78_Not_GR_OK = Not_ON_PERM;
    
endmodule

module RPSC_CARD2_testbench();
    logic clk, reset;
    logic i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low;
    logic i53_Not_G1_OK, i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, i46_DC_PS, i45_HV_Connector, 
            i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, i42_Not_OT_AN_Ready;
    logic o19_Not_G1_ON, o13_Not_Alarm, o14_Not_G1_ON_PERM, o36_Not_G1_OK, o33_Not_U_G1_Low, o39_GR_OK_Modified;
    logic o55_Not_Alarm, o62_AN_ON, o57_Not_TH_AN_Ready, o47_ON_PERM, o75_Not_AN_OK, o70_Not_U_AN_Low, o78_Not_GR_OK;

    RPSC_CARD2 dut (.*);

    parameter CLOCK_PERIOD = 10;
    integer i; // labeling case number
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
	    $dumpfile("uut.vcd");
	    $dumpvars();
        i = 0;
        {i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, i6_DC_PS, i5_U_G1_Low, i18_G1_PS_ACT, i32_G_U1_Low} = 8'b0;
        {i53_Not_G1_OK, i54_Not_CA_OK, i51_Door_PAMP, i50_Anode_PS_Fault, i49_Emergency, i48_GR_SW_PAMP, i46_DC_PS, i45_HV_Connector, 
            i44_Card_POS, i72_U_AN_Low, i59_AN_PS_ACT, i42_Not_OT_AN_Ready} = 12'b0;
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat(5) @(posedge clk);
        // if there are more cases, increment i
        i = 1;
        i18_G1_PS_ACT = 1'b1;
        repeat(5) @(posedge clk);
        i = 2;
		{i10_Card_POS, i9_Emergency, i8_Door_PAMP, i7_I_G1_High, i6_DC_PS, i5_U_G1_Low} = 6'b0;
		# 2000
        repeat(5) @(posedge clk);
        i = 3;
        i32_G_U1_Low = 1'b1;
        repeat(5) @(posedge clk);
        i = 4;
        {i72_U_AN_Low, i59_AN_PS_ACT, i42_Not_OT_AN_Ready} = 3'b111;
        repeat(5) @(posedge clk);
        $stop;
    end

endmodule