`timescale 1ns/10ps

module RPSC_CARD5 (i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1, 
                    i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON,
					o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED);
	input logic i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6,i7_FF2, i6_FF1;
					
	input logic i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON;
					
	output logic o16_Not_RF_PERM, o14_RF_perm_b,o13_Not_Alarm, o47_FF37, o59_Not_RF_RED;
	
	logic RF_perm_b_inv;
	logic FF_or_out2, nor_out;
	
	//Circuit 1 
	assign o13_Not_Alarm = (i10_FF3 | i9_FF4 | i8_FF6 | i7_FF2 | i6_FF1);
	assign o16_RF_perm_b = (i11_G2_ok_b | i12_DR_amp_ok_b | o13_Not_Alarm);
	assign RF_perm_b_inv = ~o16_RF_perm_b;
	assign o14_FF38 = ~RF_perm_b_inv;
	
	//Circuit 2
	assign FF_or_out2 = i50_FF1 | i51_FF3;
	assign nor_out = ~(FF_or_out2 | i53_G1_on_b | i54_DR_amp_on_b | i56_CA_on_b);
	assign o59_Not_RF_RED = ~(nor_out & i42_Not_Anode_ON);
							
	assign o47_FF37 = o59_Not_RF_RED;
	
endmodule

module RPSC_CARD5_testbench(); 
  
  logic i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1;
  logic i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON;
  logic o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED; 
	  
  RPSC_CARD5 dut (i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1, 
                  i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON,
		  o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED);   
   
  initial begin   
   
    i11_G2_ok_b=0; i12_DR_amp_ok_b=0; i10_FF3=0; i9_FF4=0; i8_FF6=0; i7_FF2=0; i6_FF1=0; 
    i50_FF1=0; i51_FF3=0; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=0; i42_Not_Anode_ON=0; #10;
    
    i11_G2_ok_b=0; i12_DR_amp_ok_b=1; i10_FF3=0; i9_FF4=0; i8_FF6=0; i7_FF2=0; i6_FF1=1; 
    i50_FF1=0; i51_FF3=1; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=0; i42_Not_Anode_ON=1; #10;
    
    i11_G2_ok_b=1; i12_DR_amp_ok_b=0; i10_FF3=0; i9_FF4=0; i8_FF6=0; i7_FF2=1; i6_FF1=0; 
    i50_FF1=1; i51_FF3=0; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=1; i42_Not_Anode_ON=0; #10;
    
    i11_G2_ok_b=1; i12_DR_amp_ok_b=1; i10_FF3=0; i9_FF4=0; i8_FF6=0; i7_FF2=1; i6_FF1=1; 
    i50_FF1=1; i51_FF3=1; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=1; i42_Not_Anode_ON=1; #10;
	 
  end   
endmodule 
