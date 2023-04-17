module clock_divider(clk_out, clk_in, reset);
    input logic clk_in, reset;
    output logic clk_out;

    logic [5:0] counter;

    always_ff @(posedge clk_in) begin
        if (reset)
            counter <= 6'd0;
        else
            counter <= counter + 6'd1;
    end

    assign clk_out = counter[5];

endmodule

module clock_divider_testbench();
    logic clk_out, clk_in, reset, clk;

    assign clk_in = clk;

    clock_divider dut(.*);

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat(1000) @(posedge clk);
        $stop;
    end
endmodule
