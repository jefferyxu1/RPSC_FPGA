module RPSC_CARD3(
    clk, reset, i15_AN_PS, i10_I_AN_High, i9_I_G2_High, i8_DC_PS, i7_U_AN_Low, 
    i6_Card_POS, i5_Emergency, i4_U_G2_Low, i18_G2_PS_ACT, i32_G_U2_Low, 
    i51_Card_POS, i50_Emergency, i49_DRAC_Overtemp, i59_DR_AMP, o13_Not_Alarm, 
    o14_Not_ON_PERM, o39_Ground_Hold_OK, o19_Not_G2_PS_ON, o36_Not_G2_OK, 
    o33_Not_U_G2_Low, o55_Not_Alarm, o47_Not_ON_PERM, o73_Not_DR_AMP_OK, o62_DR_AMP_ON, o78_GR_OK_Modified
);
    input logic clk, reset;
    input logic i15_AN_PS, i10_I_AN_High, i9_I_G2_High, i8_DC_PS, i7_U_AN_Low, i6_Card_POS, i5_Emergency, i4_U_G2_Low, i18_G2_PS_ACT, i32_G_U2_Low; //i18+LPF
    input logic i51_Card_POS, i50_Emergency, i49_DRAC_Overtemp, i59_DR_AMP; //i59+LPF
    output logic o13_Not_Alarm, o14_Not_ON_PERM, o39_Ground_Hold_OK, o19_Not_G2_PS_ON, o36_Not_G2_OK, o33_Not_U_G2_Low;
    output logic o55_Not_Alarm, o47_Not_ON_PERM, o73_Not_DR_AMP_OK, o62_DR_AMP_ON, o78_GR_OK_Modified;

    logic Not_Alarm, Ground_Hold_OK, SR2s_in, SR2s_out;
    logic Not_Alarm2;

    // Schematic card 3 - 1
    assign Not_Alarm = ~(i10_I_AN_High | i9_I_G2_High | i8_DC_PS | i7_U_AN_Low | i6_Card_POS | i5_Emergency | i4_U_G2_Low);
    assign Ground_Hold_OK = Not_Alarm & (~i15_AN_PS);
    assign SR2s_in = i18_G2_PS_ACT & Ground_Hold_OK;

    shiftRegister #(.N(128)) check_2_second (.on(SR2s_out), .in(SR2s_in), .clk(clk), .reset(reset));

    assign o13_Not_Alarm = Not_Alarm;
    assign o39_Ground_Hold_OK = Ground_Hold_OK; //+transistor
    assign o14_Not_ON_PERM = ~Ground_Hold_OK;
    assign o19_Not_G2_PS_ON = ~i18_G2_PS_ACT;
    assign o36_Not_G2_OK = ~SR2s_out;
    assign o33_Not_U_G2_Low = ~(SR2s_out & i32_G_U2_Low);

    // Schematic card 3 - 2
    assign Not_Alarm2 = ~(i51_Card_POS | i50_Emergency | i49_DRAC_Overtemp);

    assign o55_Not_Alarm = Not_Alarm2;
    assign o47_Not_ON_PERM = ~Not_Alarm2;
    assign o62_DR_AMP_ON = ~i59_DR_AMP; 
    assign o73_Not_DR_AMP_OK = ~(Not_Alarm2 & i59_DR_AMP); 


endmodule


module RPSC_CARD3_testbench();
    logic clk, reset;
    logic i15_AN_PS, i10_I_AN_High, i9_I_G2_High, i8_DC_PS, i7_U_AN_Low, i6_Card_POS, i5_Emergency, i4_U_G2_Low, i18_G2_PS_ACT, i32_G_U2_Low; //i18+LPF
    logic i51_Card_POS, i50_Emergency, i49_DRAC_Overtemp, i59_DR_AMP; //i59+LPF
    logic o13_Not_Alarm, o14_Not_ON_PERM, o39_Ground_Hold_OK, o19_Not_G2_PS_ON, o36_Not_G2_OK, o33_Not_U_G2_Low;
    logic o55_Not_Alarm, o47_Not_ON_PERM, o73_Not_DR_AMP_OK, o62_DR_AMP_ON, o78_GR_OK_Modified;

    RPSC_CARD3 dut (.*);

    parameter CLOCK_PERIOD = 100;
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
        {i15_AN_PS, i10_I_AN_High, i9_I_G2_High, i8_DC_PS, i7_U_AN_Low, i6_Card_POS, i5_Emergency, i4_U_G2_Low, i18_G2_PS_ACT, i32_G_U2_Low} = 10'b0;
        {i51_Card_POS, i50_Emergency, i49_DRAC_Overtemp, i59_DR_AMP} = 4'b0;
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat(20) @(posedge clk);
        // if there are more cases, increment i
        i = 1;
        i18_G2_PS_ACT = 1'b1;
        #2000
        i32_G_U2_Low = 1'b1;
        i = 2;
        i59_DR_AMP = 1'b1;
        repeat(20) @(posedge clk);
        $stop;
    end

endmodule