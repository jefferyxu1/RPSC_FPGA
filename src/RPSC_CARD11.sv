module RPSC_CARD11(clk, reset,
                    i4_FF33_G2_ON_PERM_IN,
                    i17_FF34_G2_ON_IN,
                    i23_FF35_DR_AMP_ON_PERM_IN,
                    i37_FF36_DR_AMP_ON_IN,
                    i43_FF37_RF_Reduced_Permitted_IN,
                    i57_FF38_RF_Permitted_IN,
                    i63_FF39_CA_Delay_IN,
                    o3_FF33_G2_ON_PERM_LA,
                    o19_FF34_G2_ON_LA,
                    o22_FF35_DR_AMP_ON_PERM_LA, 
                    o39_FF36_DR_AMP_ON_LA,
                    o42_FF37_RF_Reduced_Permitted_LA,
                    o59_FF38_RF_Permitted_LA,
                    o62_FF39_CA_Delay_LA);

input logic clk, reset,
                i4_FF33_G2_ON_PERM_IN,
                i17_FF34_G2_ON_IN,
                i23_FF35_DR_AMP_ON_PERM_IN,
                i37_FF36_DR_AMP_ON_IN,
                i43_FF37_RF_Reduced_Permitted_IN,
                i57_FF38_RF_Permitted_IN,
                i63_FF39_CA_Delay_IN;

output logic o3_FF33_G2_ON_PERM_LA,
                o19_FF34_G2_ON_LA,
                o22_FF35_DR_AMP_ON_PERM_LA, 
                o39_FF36_DR_AMP_ON_LA,
                o42_FF37_RF_Reduced_Permitted_LA,
                o59_FF38_RF_Permitted_LA,
                o62_FF39_CA_Delay_LA;

endmodule