module RPSC_CARD11(clk, reset,
                    i4_FF33_IN,
                    i17_FF34_IN,
                    i23_FF35_IN,
                    i37_FF36_IN,
                    i43_FF37_IN,
                    i57_FF38_IN,
                    i63_FF39_IN,
                    o3_FF33_LA,
                    o19_FF34_LA,
                    o22_FF35_LA, 
                    o39_FF36_LA,
                    o42_FF37_LA,
                    o59_FF38_LA,
                    o62_FF39_LA);

input logic clk, reset,
                i4_FF33_IN,
                i17_FF34_IN,
                i23_FF35_IN,
                i37_FF36_IN,
                i43_FF37_IN,
                i57_FF38_IN,
                i63_FF39_IN;

output logic o3_FF33_LA,
                o19_FF34_LA,
                o22_FF35_LA, 
                o39_FF36_LA,
                o42_FF37_LA,
                o59_FF38_LA,
                o62_FF39_LA;

endmodule