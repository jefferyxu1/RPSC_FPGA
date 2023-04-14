`timescale 1ns/10ps

module RPSC_CARD5 (i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1, 
                    i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON,
					o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED);
	input logic i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1;
					
	input logic i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON;
					
	output logic o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED;
	
	logic FF1_FF3, nand_out;
	
	//Left Circuit 
	assign o13_Not_Alarm = ~(i10_FF3 | i9_FF4 | i8_FF6 | i7_FF2 | i6_FF1);
	assign o16_Not_RF_PERM = ~((~i11_Not_G2_OK) & (~i12_Not_DR_AMP_OK) & o13_Not_Alarm);
	assign o14_FF38 = o16_Not_RF_PERM;
	
	//Right Circuit
	assign FF1_FF3 = ~(i50_FF1 | i51_FF3);
	assign nand_out = ~(FF1_FF3 & (~i53_Not_G1_OK) & (~i54_Not_DR_AMP_OK) & (~i56_Not_CA_ON) & i42_Not_Anode_ON) ;
	assign o59_Not_RF_RED = nand_out;
	assign o47_FF37 = nand_out;
	
endmodule

module RPSC_CARD5_testbench(); 
  
	logic i11_Not_G2_OK, i12_Not_DR_AMP_OK, i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1;
	logic i50_FF1, i51_FF3, i53_Not_G1_OK, i54_Not_DR_AMP_OK, i56_Not_CA_ON, i42_Not_Anode_ON;
	logic o16_Not_RF_PERM, o14_FF38, o13_Not_Alarm, o47_FF37, o59_Not_RF_RED; 
		
	RPSC_CARD5 dut (.*);   

	integer i;

	initial begin   
		i = 0; // flip flop are 0
		{i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1} = 5'b0;
		for (int j = 0; j < 4; j++) begin
			{i11_Not_G2_OK, i12_Not_DR_AMP_OK} = j;
			#1000;
		end
		i = 1; // flip flop are 1
		{i10_FF3, i9_FF4, i8_FF6, i7_FF2, i6_FF1} = 5'b1;
		for (int j = 0; j < 4; j++) begin
			{i11_Not_G2_OK, i12_Not_DR_AMP_OK} = j;
			#1000;
		end
		i = 2; // now test right circuit
		for (int j = 0; j < 64; j++) begin
			{i51_FF3, i50_FF1, i56_Not_CA_ON, i54_Not_DR_AMP_OK, i53_Not_G1_OK, i42_Not_Anode_ON} = j;
			#1000;
		end
		$stop;
	end   
endmodule 