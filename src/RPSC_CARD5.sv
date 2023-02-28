`timescale 1ns/10ps

module RPSC_CARD5 (G2_ok_b, DR_amp_ok_b, ff3_pin10, ff4, ff6, ff2, ff1_pin6, 
                     ff1_pin50, ff3_pin51, G1_on_b, DR_amp_on_b, CA_on_b, anode_on_b,
							   RF_perm_b, RF_perm_b_38in, alarm_b, RF_red_b_27in, RF_red_b) ;
	input logic G2_ok_b, 
	            DR_amp_ok_b, 
					ff3_pin10, 
					ff4, 
					ff6,
					ff2, 
					ff1_pin6;
					
	input logic ff1_pin50, 
	            ff3_pin51, 
					G1_on_b, 
					DR_amp_on_b, 
					CA_on_b, 
					anode_on_b;
					
	output logic RF_perm_b, 
					 RF_perm_b_38in,
	             alarm_b, 
					 RF_red_b_27in, 
					 RF_red_b;
	
	logic ff_or_out, RF_perm_b_inv;
	logic ff_or_out2, nor_out;
	
	//Circuit 1 
	or   #0.05 or1   (ff_or_out,      
	                  ff3_pin10,    
							ff4,         
							ff6,      
							ff2,    
							ff1_pin6);
							
	or   #0.05 or2   (RF_perm_b,      
							G2_ok_b,      
							DR_amp_ok_b, 
							ff_or_out);
							
	not  #0.05 inv1  (RF_perm_b_inv,  
							RF_perm_b);
							
	not  #0.05 inv2  (RF_perm_b_38in, 
							RF_perm_b_inv);
	
	
	//Circuit 2
	or   #0.05 or3   (ff_or_out2, 
							ff1_pin50,    
							ff3_pin51);
							
	nor  #0.05 nor1  (nor_out,        
	                  ff_or_out2,   
							G1_on_b,      
							DR_amp_on_b, 
							CA_on_b);
							
	nand #0.05 nand1 (RF_red_b,       
	                  nor_out,      
							anode_on_b);
							
	assign RF_red_b_27in = RF_red_b;
	
	
endmodule

module RPSC_CARD5_testbench(); 
  
  logic G2_ok_b, 
	     DR_amp_ok_b, 
		  ff3_pin10, 
			ff4, 
			ff6,
			ff2, 
			ff1_pin6;
					
	logic ff1_pin50, 
	      ff3_pin51, 
			G1_on_b, 
			DR_amp_on_b, 
			CA_on_b, 
			anode_on_b;
					
	logic RF_perm_b, 
		   RF_perm_b_38in,
	      alarm_b, 
			RF_red_b_27in, 
			RF_red_b; 
	  
  RPSC_CARD5 dut (G2_ok_b, DR_amp_ok_b, ff3_pin10, ff4, ff6, ff2, ff1_pin6, 
                     ff1_pin50, ff3_pin51, G1_on_b, DR_amp_on_b, CA_on_b, anode_on_b,
							   RF_perm_b, RF_perm_b_38in, alarm_b, RF_red_b_27in, RF_red_b) ;   
   
  initial begin   
   
    G2_ok_b=0; DR_amp_ok_b=0; ff3_pin10=0; ff4=0; ff6=0; ff2=0; ff1_pin6=0; 
	 ff1_pin50=0; ff3_pin51=0; G1_on_b=0; DR_amp_on_b=0; CA_on_b=0; anode_on_b=0; #10;
	 
	 G2_ok_b=0; DR_amp_ok_b=1; ff3_pin10=0; ff4=0; ff6=0; ff2=0; ff1_pin6=1; 
	 ff1_pin50=0; ff3_pin51=1; G1_on_b=0; DR_amp_on_b=0; CA_on_b=0; anode_on_b=1; #10;
	 
	 G2_ok_b=1; DR_amp_ok_b=0; ff3_pin10=0; ff4=0; ff6=0; ff2=1; ff1_pin6=0; 
	 ff1_pin50=1; ff3_pin51=0; G1_on_b=0; DR_amp_on_b=0; CA_on_b=1; anode_on_b=0; #10;
	 
	 G2_ok_b=1; DR_amp_ok_b=1; ff3_pin10=0; ff4=0; ff6=0; ff2=1; ff1_pin6=1; 
	 ff1_pin50=1; ff3_pin51=1; G1_on_b=0; DR_amp_on_b=0; CA_on_b=1; anode_on_b=1; #10;
	 
  end   
endmodule 