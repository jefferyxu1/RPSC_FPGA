module inputFF(clk, reset, out, in);
    input logic clk, reset, in;
    output logic out;

    logic intermediate;

    // Comment following section during simulation
    // always_ff @(posedge clk) begin
    //     if (reset) begin
    //         intermediate <= 1'b0;
    //         out <= 1'b0;
    //     end
    //     else begin
    //         intermediate <= in;
    //         out <= intermediate;
    //     end
    // end
    // Comment until here
    
    assign out = in;
endmodule
