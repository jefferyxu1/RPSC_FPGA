// TODO: o78 FF40 existed?
module RPSC_CARD11(clk, reset, reset_hold_error, LA_Test,
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

input logic clk, reset, LA_Test, reset_hold_error,
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

    FF #(.initial_low(1)) FF33 (
        .out(), 
        .LA(o3_FF33_G2_ON_PERM_LA), 
        .in(i4_FF33_G2_ON_PERM_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF34 (
        .out(), 
        .LA(o19_FF34_G2_ON_LA), 
        .in(i17_FF34_G2_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF #(.initial_low(1)) FF35 (
        .out(), 
        .LA(o22_FF35_DR_AMP_ON_PERM_LA), 
        .in(i23_FF35_DR_AMP_ON_PERM_IN), 
        .reset(reset_hold_error), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF36 (
        .out(), 
        .LA(o39_FF36_DR_AMP_ON_LA), 
        .in(i37_FF36_DR_AMP_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF37 (
        .out(), 
        .LA(o42_FF37_RF_Reduced_Permitted_LA), 
        .in(i43_FF37_RF_Reduced_Permitted_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF38 (
        .out(), 
        .LA(o59_FF38_RF_Permitted_LA), 
        .in(i57_FF38_RF_Permitted_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF39 (
        .out(), 
        .LA(o62_FF39_CA_Delay_LA), 
        .in(i63_FF39_CA_Delay_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

endmodule