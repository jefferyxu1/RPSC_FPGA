module RPSC_CARD1(o19_FAN_ON, o14_FAN_ON_PERM, o55_Not_Alarm, 
    o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, o75_Not_CA_OK, 
    o70_I_CA_High, o77_U_CA_Low, o78_Modified, clk, reset, 
    i17_FAN_ON_PERM, i18_FAN_ACT, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low
);

    output logic o19_FAN_ON, o14_FAN_ON_PERM;
    input logic i17_FAN_ON_PERM, i18_FAN_ACT;
    output logic o55_Not_Alarm, o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified;
    input logic clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low;

    logic norStatus, norControl, andControl, on_4s;

    assign o14_FAN_ON_PERM = ~i17_FAN_ON_PERM;
    assign o19_FAN_ON = ~i18_FAN_ACT; 

    assign norStatus = ~(i51_Card_POS | i50_Air_Grid | i49_Water_Anode | i48_Water_Grid | i46_DC_PS | i45_U_CA_Low | i44_I_CA_High);
    assign norControl = ~(i53_Not_G1_OK | i54_FAN_ON | (~norStatus));
    assign andControl = norControl & i59_CA_PS_ACT;

    // Using smaller parameter when testing
    // Assume clock period 1.28 us
    // timer #(.WIDTH(22)) timer4s (.clk(clk), .reset(reset), .target(22'd3125000), .in(andControl), .hit_target(on_4s));
    timer #(.WIDTH(4)) timer4s_test (.clk(clk), .reset(reset), .target(4'd15), .in(andControl), .hit_target(on_4s));
    special_60s_timer timer60s (.clk(clk), .reset(reset), .in(on_4s), .hit_target(on_60s));

    assign o55_Not_Alarm = norStatus;
    assign o47_CA_ON_PERM = ~norControl;
    assign o78_Modified = norControl;
    assign o62_CA_ON = ~i59_CA_PS_ACT;
    assign o74_CA_Delay = on_60s;
    assign o75_Not_CA_OK = ~(on_4s & on_60s);
    assign o70_I_CA_High = ~(on_4s & i72_I_CA_High);
    assign o77_U_CA_Low = ~(on_4s & i76_U_CA_Low);

endmodule

module RPSC_CARD1_testbench();
    logic o19_FAN_ON, o14_FAN_ON_PERM;
    logic i17_FAN_ON_PERM, i18_FAN_ACT;
    logic o55_Not_Alarm, o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified;
    logic clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low;

    RPSC_CARD1 dut (.*);

    parameter CLOCK_PERIOD = 100;
    integer i; // labeling case number
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
        // Turn on system
        i = 0;
        {i17_FAN_ON_PERM, i18_FAN_ACT} = 2'b0;
        {i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS, i45_U_CA_Low, i44_I_CA_High} = 7'b0;
        i59_CA_PS_ACT = 1'b1;
        {i54_FAN_ON, i53_Not_G1_OK} = 2'b0;
        {i72_I_CA_High, i76_U_CA_Low} = 2'b0;
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat(20) @(posedge clk);
        // if there are more cases, increment i
        i = 1;
        $stop;
    end

endmodule
