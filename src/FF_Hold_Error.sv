// The parameter decides whether the LA is on or off when the reset is pressed. Default off when the reset pressed.
module FF_Hold_Error #(parameter LA_on_when_Reset = 0) (out, LA, in, reset, LA_Test, clk);
    input logic in, reset, LA_Test, clk;
    output logic out, LA;

    logic in_mux_out;

    always_ff @(posedge clk) begin
        if (reset)
            out <= 1'b0;
        else
            out <= ~in_mux_out;
    end

    generate
        if (LA_on_when_Reset)
            assign LA = out | LA_Test | reset;
        else
            assign LA = out | LA_Test;
    endgenerate
    assign in_mux_out = out? 1'b0 : in;

    // assign LA = out | LA_Test;

    // always_ff @(posedge clk) begin
    //     if (reset)
    //         out <= 1'b0;
    //     else
    //         out <= ~in;
    // end

endmodule

module FF_Hold_Error_testbench ();
    logic in, reset, LA_Test, clk;
    logic out, LA;

    FF_Hold_Error dut (.*);

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; LA_Test <= 1'b0; @(posedge clk);
        reset <= 1'b0; in <= 1'b1; @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        in <= 1'b0; @(posedge clk);
        in <= 1'b1; @(posedge clk);
        @(posedge clk);
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end
endmodule