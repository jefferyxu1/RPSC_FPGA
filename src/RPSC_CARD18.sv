`timescale 1ns/10ps
// TODO: Figure out Input pin 12, 17, and 34

module RPSC_CARD18 (i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON, i12_Not_ANY_SB_GO_OFF, i34_Not_ANY_HV_GO_OFF,
					i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready,
					o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready);

	input  logic i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON, i12_Not_ANY_SB_GO_OFF, i34_Not_ANY_HV_GO_OFF;
	input  logic i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	output logic o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready;
	
	assign o47_Not_SB_ON = i4_Not_FAN_ON | i5_Not_G1_ON | i6_Not_CA_ON;
	assign o42_Not_SB_OFF = ~(i3_Not_DR_AMP_ON & i4_Not_FAN_ON & i5_Not_G1_ON & i6_Not_CA_ON);
	assign o46_Not_HV_ON = i18_Not_G2_ON | i19_Not_Anode_ON;
		 
	nand   #0.05 
	nANd1   
	  (o45_Not_HV_OFF,      
	   i18_Not_G2_ON,    
	   i19_Not_Anode_ON);
	
	// wiring
	assign o78_Not_RED_RF  = i77_Not_RF_RED;
	assign o76_Not_Full_RF  = i75_Not_RF_PERM;
	assign o74_Not_HV_Ready = i73_Not_AN_HV_Ready;
	
endmodule

module RPSC_CARD18_testbench(); 
  
	logic i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON, i34_Not_ANY_HV_GO_OFF;
	logic i17_PS_ON, i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	logic o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_OFF, o78_Not_RED_RF, o76_Not_Full_RF, o74_Not_HV_Ready;
  
    RPSC_CARD18 dut (.*) ; 

	initial begin 
		{i73_Not_AN_HV_Ready, i75_Not_RF_PERM, i77_Not_RF_RED} = 3'b000;

		for (int j = 0; j < 16; j++) begin
			{i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON} = j;
			#1000;
		end

		for (int j = 0; j < 8; j++) begin
			{i18_Not_G2_ON, i19_Not_Anode_ON, i34_Not_ANY_HV_GO_OFF} = j;
			#1000;
		end

	 
	end   		
  
endmodule 

