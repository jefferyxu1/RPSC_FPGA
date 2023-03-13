`timescale 1ns/10ps

module RPSC_CARD5 (i11_G2_ok_b, i12_DR_amp_ok_b, i10_ff3, i9_ff4, i8_ff6, i7_ff2, i6_ff1, 
                     i50_ff1, i51_ff3, i53_G1_on_b, i54_DR_amp_on_b, i56_CA_on_b, i42_anode_on_b,
			o16_RF_perm_b, o14_RF_perm_b_38in, o13_alarm_b, o47_RF_red_b_27in, o59_RF_red_b) ;
	input logic i11_G2_ok_b, i12_DR_amp_ok_b, i10_ff3, i9_ff4, i8_ff6,i7_ff2, i6_ff1;
					
	input logic i50_ff1, i51_ff3, i53_G1_on_b, i54_DR_amp_on_b, i56_CA_on_b, i42_anode_on_b;
					
	output logic o16_RF_perm_b, o14_RF_perm_b_38in,o13_alarm_b, o47_RF_red_b_27in, o59_RF_red_b;
	
	logic RF_perm_b_inv;
	logic ff_or_out2, nor_out;
	
	//Circuit 1 
	assign o13_alarm_b = (i10_ff3 | i9_ff4 | i8_ff6 | i7_ff2 | i6_ff1);
	assign o16_RF_perm_b = (i11_G2_ok_b | i12_DR_amp_ok_b | o13_alarm_b);
	assign RF_perm_b_inv = ~o16_RF_perm_b;
	assign o14_RF_perm_b_38in = ~RF_perm_b_inv;
	
	//Circuit 2
	assign ff_or_out2 = i50_ff1 | i51_ff3;
	assign nor_out = ~(ff_or_out2 | i53_G1_on_b | i54_DR_amp_on_b | i56_CA_on_b);
	assign o59_RF_red_b = ~(nor_out & i42_anode_on_b);
							
	assign o47_RF_red_b_27in = o59_RF_red_b;
	
endmodule

module RPSC_CARD5_testbench(); 
  
  logic i11_G2_ok_b, i12_DR_amp_ok_b, i10_ff3, i9_ff4, i8_ff6, i7_ff2, i6_ff1;
  logic i50_ff1, i51_ff3, i53_G1_on_b, i54_DR_amp_on_b, i56_CA_on_b, i42_anode_on_b;
  logic o16_RF_perm_b, o14_RF_perm_b_38in, o13_alarm_b, o47_RF_red_b_27in, o59_RF_red_b; 
	  
  RPSC_CARD5 dut (i11_G2_ok_b, i12_DR_amp_ok_b, i10_ff3, i9_ff4, i8_ff6, i7_ff2, i6_ff1, 
                  i50_ff1, i51_ff3, i53_G1_on_b, i54_DR_amp_on_b, i56_CA_on_b, i42_anode_on_b,
		  o16_RF_perm_b, o14_RF_perm_b_38in, o13_alarm_b, o47_RF_red_b_27in, o59_RF_red_b) ;   
   
  initial begin   
   
    i11_G2_ok_b=0; i12_DR_amp_ok_b=0; i10_ff3=0; i9_ff4=0; i8_ff6=0; i7_ff2=0; i6_ff1=0; 
    i50_ff1=0; i51_ff3=0; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=0; i42_anode_on_b=0; #10;
    
    i11_G2_ok_b=0; i12_DR_amp_ok_b=1; i10_ff3=0; i9_ff4=0; i8_ff6=0; i7_ff2=0; i6_ff1=1; 
    i50_ff1=0; i51_ff3=1; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=0; i42_anode_on_b=1; #10;
    
    i11_G2_ok_b=1; i12_DR_amp_ok_b=0; i10_ff3=0; i9_ff4=0; i8_ff6=0; i7_ff2=1; i6_ff1=0; 
    i50_ff1=1; i51_ff3=0; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=1; i42_anode_on_b=0; #10;
    
    i11_G2_ok_b=1; i12_DR_amp_ok_b=1; i10_ff3=0; i9_ff4=0; i8_ff6=0; i7_ff2=1; i6_ff1=1; 
    i50_ff1=1; i51_ff3=1; i53_G1_on_b=0; i54_DR_amp_on_b=0; i56_CA_on_b=1; i42_anode_on_b=1; #10;
	 
  end   
endmodule 
