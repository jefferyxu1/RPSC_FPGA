module RPSC_CARD10(clk, reset, LA_Test,
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

    input logic clk, reset, LA_Test,
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

    FF FF25 (
        .out(), 
        .LA(o3_FF25_FAN_ON_PERM_LA), 
        .in(i4_FF25_FAN_ON_PERM_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF26 (
        .out(o14_FF26_FAN_ON_EP1_39), 
        .LA(o19_FF26_FAN_ON_LA), 
        .in(i17_FF26_FAN_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF27 (
        .out(), 
        .LA(o22_FF27_CA_ON_PERM_LA), 
        .in(i23_FF27_CA_ON_PERM_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF28 (
        .out(o34_FF28_CA_ON_EP1_40), 
        .LA(o39_FF28_CA_ON_LA), 
        .in(i37_FF28_CA_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF29 (
        .out(), 
        .LA(o42_FF29_G1_ON_PERM_LA), 
        .in(i43_FF29_G1_ON_PERM_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
    
    FF FF30 (
        .out(), 
        .LA(o59_FF30_G1_ON_LA), 
        .in(i57_FF30_G1_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF31 (
        .out(), 
        .LA(o62_FF31_Anode_ON_PERM_LA), 
        .in(i63_FF31_Anode_ON_PERM_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));

    FF FF32 (
        .out(), 
        .LA(o78_FF32_Anode_ON_LA), 
        .in(i76_FF32_Anode_ON_IN), 
        .reset(reset), 
        .LA_Test(LA_Test), 
        .clk(clk));
endmodule