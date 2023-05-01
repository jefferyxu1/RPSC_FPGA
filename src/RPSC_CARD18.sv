`timescale 1ns/10ps
// TODO: Figure out Input pin 12, 17, and 34

module RPSC_CARD18 (clk, reset, i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON,
					i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready,
					o12_Not_ANY_SB_GO_OFF, o34_Not_ANY_HV_GO_OFF, o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, 
					o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready);

	input logic clk, reset;
	input  logic i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON;
	input  logic i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	output logic o12_Not_ANY_SB_GO_OFF, o34_Not_ANY_HV_GO_OFF;
	output logic o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready;
	
	logic leftRCDelayOut, rightRCDelayOut;

	assign o47_Not_SB_ON = i4_Not_FAN_ON | i5_Not_G1_ON | i6_Not_CA_ON;
	assign o42_Not_SB_OFF = ~(i3_Not_DR_AMP_ON & i4_Not_FAN_ON & i5_Not_G1_ON & i6_Not_CA_ON);
	assign o46_Not_HV_ON = i18_Not_G2_ON | i19_Not_Anode_ON;
	assign o45_Not_HV_OFF = ~(i18_Not_G2_ON & i19_Not_Anode_ON);
	
	// wiring
	assign o78_Not_RED_RF = i77_Not_RF_RED;
	assign o76_Not_Full_RF = i75_Not_RF_PERM;
	assign o74_Not_HV_Ready = i73_Not_AN_HV_Ready;
	
	timer_card18 leftRCDelay (.clk(clk), .reset(reset), .in(i3_Not_DR_AMP_ON | i4_Not_FAN_ON | i5_Not_G1_ON | i6_Not_CA_ON), 
								.out(leftRCDelayOut));

	timer_card18 rightRCDelay (.clk(clk), .reset(reset), .in(i18_Not_G2_ON | i19_Not_Anode_ON), .out(rightRCDelayOut));
	
	assign o12_Not_ANY_SB_GO_OFF = ~leftRCDelayOut;
	assign o34_Not_ANY_HV_GO_OFF = ~rightRCDelayOut;

endmodule

module RPSC_CARD18_testbench(); 
	logic clk, reset;
	logic i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON;
	logic i17_PS_ON, i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	logic o12_Not_ANY_SB_GO_OFF, o34_Not_ANY_HV_GO_OFF, o47_Not_SB_ON, o42_Not_SB_OFF, 
			o46_Not_HV_ON, o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready;
  
    RPSC_CARD18 dut (.*) ; 

	parameter CLOCK_PERIOD = 1000;
    integer i;
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

	initial begin 
		reset <= 1'b1; @(posedge clk); 
		reset <= 1'b0; @(posedge clk);
		{i73_Not_AN_HV_Ready, i75_Not_RF_PERM, i77_Not_RF_RED} <= 3'b000;

		for (int j = 0; j < 16; j++) begin
			{i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON} = j;
			@(posedge clk);
		end

		for (int j = 0; j < 8; j++) begin
			{i18_Not_G2_ON, i19_Not_Anode_ON} = j;
			@(posedge clk);
		end

		reset <= 1'b1; @(posedge clk); 
		reset <= 1'b0; @(posedge clk);

		{i18_Not_G2_ON, i19_Not_Anode_ON} <= 2'b0;
		repeat(30) @(posedge clk);
		{i18_Not_G2_ON, i19_Not_Anode_ON} <= 2'b1;
		repeat(30) @(posedge clk);
		{i18_Not_G2_ON, i19_Not_Anode_ON} <= 2'b0;
		repeat(30) @(posedge clk);
		$stop;
	end   		
  
endmodule 

