`timescale 1ns/10ps
// TODO: Figure out Input pin 17 and 34

module RPSC_CARD18 (i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON,
					i17_PS_ON, i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready,
					o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_ON, o78_Not_RF_PERM, o76_Not_RF_PERM, o74_Not_HV_Ready);

	input  logic i3_Not_DR_AMP_ON, i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON;
	input  logic i17_PS_ON, i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	output logic o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_ON, o78_Not_RF_PERM, o76_Not_RF_PERM, o74_Not_HV_Ready;
	
	logic or_o1; 
	
	// Circuit 1 
	or   #0.05 
	or1   
	(o47_Not_SB_ON,      
	 i4_Not_FAN_ON,    
	 i5_Not_G1_ON,         
	 i6_Not_CA_ON,);
	
	not  #0.05 
	inv1  
	(o42_Not_SB_OFF,  
	 o47_Not_SB_ON);
	
	// Circuit 2
	or   #0.05 
	or2   
	 (o46_Not_HV_ON,      
	  i18_Not_G2_ON,    
	  i19_Not_Anode_ON);
		 
	nANd   #0.05 
	nANd1   
	  (o45_Not_HV_ON,      
	   i18_Not_G2_ON,    
	   i19_Not_Anode_ON);
	
	// wiring
	assign o78_Not_RF_PERM  = i77_Not_RF_RED;
	assign o76_Not_RF_PERM  = i75_Not_RF_PERM;
	assign o74_Not_HV_Ready = i73_Not_AN_HV_Ready;
	
endmodule

module RPSC_CARD18_testbench(); 
  
	logic i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON;
	logic i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready;
	logic o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_ON, o78_Not_RF_PERM, o76_Not_RF_PERM, o74_Not_HV_Ready;
  
    RPSC_CARD18 dut (i4_Not_FAN_ON, i5_Not_G1_ON, i6_Not_CA_ON,
		i18_Not_G2_ON, i19_Not_Anode_ON, i77_Not_RF_RED, i75_Not_RF_PERM, i73_Not_AN_HV_Ready,
		o47_Not_SB_ON, o42_Not_SB_OFF, o46_Not_HV_ON, o45_Not_HV_ON, o78_Not_RF_PERM, o76_Not_RF_PERM, o74_Not_HV_Ready) ; 
			
	initial begin   
   
    i4_Not_FAN_ON=0; i5_Not_G1_ON  =0; i6_Not_CA_ON     =0; 
	 i18_Not_G2_ON  =0; i19_Not_Anode_ON=0; 
	 i77_Not_RF_RED =0; i75_Not_RF_PERM =0; i73_Not_AN_HV_Ready=0; #10;
	 i4_Not_FAN_ON=0; i5_Not_G1_ON  =0; i6_Not_CA_ON     =1; 
	 i18_Not_G2_ON  =0; i19_Not_Anode_ON=1; 
	 i77_Not_RF_RED =0; i75_Not_RF_PERM =0; i73_Not_AN_HV_Ready=1; #10;
	 i4_Not_FAN_ON=0; i5_Not_G1_ON  =1; i6_Not_CA_ON     =0; 
	 i18_Not_G2_ON  =1; i19_Not_Anode_ON=0; 
	 i77_Not_RF_RED =0; i75_Not_RF_PERM =1; i73_Not_AN_HV_Ready=0; #10;
	 i4_Not_FAN_ON=1; i5_Not_G1_ON  =0; i6_Not_CA_ON     =0; 
	 i18_Not_G2_ON  =1; i19_Not_Anode_ON=0; 
	 i77_Not_RF_RED =1; i75_Not_RF_PERM =0; i73_Not_AN_HV_Ready=0; #10;
	 i4_Not_FAN_ON=1; i5_Not_G1_ON  =1; i6_Not_CA_ON     =1; 
	 i18_Not_G2_ON  =1; i19_Not_Anode_ON=1; 
	 i77_Not_RF_RED =1; i75_Not_RF_PERM =1; i73_Not_AN_HV_Ready=1; #10;
	 
  end   		
  
endmodule 
