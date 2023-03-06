`timescale 1ns/10ps

module card18 (i4_Fan_on_b, i5_G1_on_b, i6_CA_on_b,
					i18_G2_on, i19_anode_on, i77_rf_red, i75_rf_perm, i73_an_hv_ready,
					o47_SB_on_b, o42_SB_off_b, o46_hv_on, o45_hv_on, o78_rf_perm, o76_rf_perm, o74_hv_ready) ;

	input  logic i4_Fan_on_b, i5_G1_on_b, i6_CA_on_b;
	input  logic i18_G2_on, i19_anode_on, i77_rf_red, i75_rf_perm, i73_an_hv_ready;
	output logic o47_SB_on_b, o42_SB_off_b, o46_hv_on, o45_hv_on, o78_rf_perm, o76_rf_perm, o74_hv_ready;
	
	logic or_o1; 
	
	// Circuit 1 
	or   #0.05 
	or1   
		(o47_SB_on_b,      
	    i4_Fan_on_b,    
		 i5_G1_on_b,         
		 i6_CA_on_b,);
	
	not  #0.05 
	inv1  
		(o42_SB_off_b,  
		 o47_SB_on_b);
	
	// Circuit 2
	or   #0.05 
	or2   
		(o46_hv_on,      
	    i18_G2_on,    
		 i19_anode_on);
		 
	nand   #0.05 
	nand1   
		(o45_hv_on,      
	    i18_G2_on,    
		 i19_anode_on);
	
	// wiring
	assign o78_rf_perm  = i77_rf_red;
	assign o76_rf_perm  = i75_rf_perm;
	assign o74_hv_ready = i73_an_hv_ready;
	
endmodule

module card18_testbench(); 
  
	logic i4_Fan_on_b, i5_G1_on_b, i6_CA_on_b;
	logic i18_G2_on, i19_anode_on, i77_rf_red, i75_rf_perm, i73_an_hv_ready;
	logic o47_SB_on_b, o42_SB_off_b, o46_hv_on, o45_hv_on, o78_rf_perm, o76_rf_perm, o74_hv_ready;
  
   card18 dut (i4_Fan_on_b, i5_G1_on_b, i6_CA_on_b,
					i18_G2_on, i19_anode_on, i77_rf_red, i75_rf_perm, i73_an_hv_ready,
					o47_SB_on_b, o42_SB_off_b, o46_hv_on, o45_hv_on, o78_rf_perm, o76_rf_perm, o74_hv_ready) ; 
			
	initial begin   
   
    i4_Fan_on_b=0; i5_G1_on_b  =0; i6_CA_on_b     =0; 
	 i18_G2_on  =0; i19_anode_on=0; 
	 i77_rf_red =0; i75_rf_perm =0; i73_an_hv_ready=0; #10;
	 i4_Fan_on_b=0; i5_G1_on_b  =0; i6_CA_on_b     =1; 
	 i18_G2_on  =0; i19_anode_on=1; 
	 i77_rf_red =0; i75_rf_perm =0; i73_an_hv_ready=1; #10;
	 i4_Fan_on_b=0; i5_G1_on_b  =1; i6_CA_on_b     =0; 
	 i18_G2_on  =1; i19_anode_on=0; 
	 i77_rf_red =0; i75_rf_perm =1; i73_an_hv_ready=0; #10;
	 i4_Fan_on_b=1; i5_G1_on_b  =0; i6_CA_on_b     =0; 
	 i18_G2_on  =1; i19_anode_on=0; 
	 i77_rf_red =1; i75_rf_perm =0; i73_an_hv_ready=0; #10;
	 i4_Fan_on_b=1; i5_G1_on_b  =1; i6_CA_on_b     =1; 
	 i18_G2_on  =1; i19_anode_on=1; 
	 i77_rf_red =1; i75_rf_perm =1; i73_an_hv_ready=1; #10;
	 
  end   		
  
endmodule 