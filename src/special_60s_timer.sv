module special_60s_timer(clk, reset, in, hit_target);
    input logic clk, reset, in;
    output logic hit_target;

    logic on4s, on60s;
    
    // Clock Period 1.28 us
    timer #(.WIDTH(22)) timer4s (.clk(clk), .reset(reset), .target(22'd3125000), .in(1'b1), .hit_target(on4s));
    timer #(.WIDTH(26)) timer60s (.clk(clk), .reset(reset), .target(26'd67108864), .in(in), .hit_target(on60s));

    // Shorter Counter for testbench
    // timer #(.WIDTH(4)) timer4s (.clk(clk), .reset(reset), .target(4'd15), .in(1'b1), .hit_target(on4s));
    // timer #(.WIDTH(6)) timer60s (.clk(clk), .reset(reset), .target(6'd60), .in(in), .hit_target(on60s));

    assign hit_target = (~on4s) | on60s;

endmodule

module special_60s_timer_testbench();
    logic clk, reset, in, hit_target;

    special_60s_timer dut (.*);

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; in <= 1'b1; @(posedge clk);
        reset <= 1'b0;
        repeat(100) @(posedge clk);
        in <= 1'b0; @(posedge clk);
        in <= 1'b1;
        repeat (100) @(posedge clk);
        $stop;
    end

endmodule