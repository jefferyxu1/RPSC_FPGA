module RPSC_CARD10(clk, reset,
                    i4_FF25_FAN_ON_PERM_IN,
                    i17_FF26_FAN_ON_IN,
                    i23_FF27_CA_ON_PERM_IN,
                    i37_FF28_CA_ON_IN,
                    i43_FF29_G1_ON_PERM_IN,
                    i57_FF30_G1_ON_IN,
                    i63_FF31_Anode_ON_PERM_IN,
                    i76_FF32_Anode_ON_IN,
                    o3_FF25_FAN_ON_PERM_LA,
                    o19_FF26_FAN_ON_LA, o14_FF26_FAN_ON_EP1_39,
                    o22_FF27_CA_ON_PERM_LA, 
                    o39_FF28_CA_ON_LA, o34_FF28_CA_ON_EP1_40,
                    o42_FF29_G1_ON_PERM_LA,
                    o59_FF30_G1_ON_LA,
                    o62_FF31_Anode_ON_PERM_LA,
                    o78_FF32_Anode_ON_LA);

    input logic clk, reset,
            i4_FF25_FAN_ON_PERM_IN,
            i17_FF26_FAN_ON_IN,
            i23_FF27_CA_ON_PERM_IN,
            i37_FF28_CA_ON_IN,
            i43_FF29_G1_ON_PERM_IN,
            i57_FF30_G1_ON_IN,
            i63_FF31_Anode_ON_PERM_IN,
            i76_FF32_Anode_ON_IN;

    output logic o3_FF25_FAN_ON_PERM_LA,
                 o19_FF26_FAN_ON_LA, o14_FF26_FAN_ON_EP1_39,
                 o22_FF27_CA_ON_PERM_LA, 
                 o39_FF28_CA_ON_LA, o34_FF28_CA_ON_EP1_40,
                 o42_FF29_G1_ON_PERM_LA,
                 o59_FF30_G1_ON_LA,
                 o62_FF31_Anode_ON_PERM_LA,
                 o78_FF32_Anode_ON_LA;

endmodule