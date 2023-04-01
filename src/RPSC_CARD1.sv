module RPSC_CARD1(o55_Not_Alarm, o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified,
    clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low
);

    output logic o55_Not_Alarm, o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified;
    input logic clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low;

    logic norStatus, norControl, andControl, on_4s;

    assign norStatus = ~(i51_Card_POS | i50_Air_Grid | i49_Water_Anode | i48_Water_Grid | i46_DC_PS | i45_U_CA_Low | i44_I_CA_High);
    assign norControl = ~(i53_Not_G1_OK | i54_FAN_ON | norStatus);
    assign andControl = norControl & i59_CA_PS_ACT;
    
    shiftRegister #(.N(256)) check_4_second (.on(on_4s), .in(andControl), .clk(clk).reset(reset));
    shiftRegister #(.N(3840)) check_60_second(.on(on_60s), .in(on_4s), .clk(clk), .reset(reset));
    
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
    logic o55_Not_Alarm, o47_CA_ON_PERM, o62_CA_ON, o74_CA_Delay, 
    o75_Not_CA_OK, o70_I_CA_High, o77_U_CA_Low, o78_Modified;
    logic clk, reset, i54_FAN_ON, i53_Not_G1_OK, i59_CA_PS_ACT,  
    i51_Card_POS, i50_Air_Grid, i49_Water_Anode, i48_Water_Grid, i46_DC_PS,
    i45_U_CA_Low, i44_I_CA_High, i72_I_CA_High, i76_U_CA_Low;

    RPSC_CARD1 dut (.*);

    parameter CLOCK_PERIOD = 100;
    integer i;
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat(100) @(posedge clk);
        $stop;
    end

endmodule

