module special_60s_timer #(parameter test_mode = 0) (clk, reset, in, hit_target);
    input logic clk, reset, in;
    output logic hit_target;

    logic on60s;

    localparam [1:0]
        s_start = 2'b00,
        s_timer = 2'b01,
        s_done = 2'b10;

    logic [1:0] ps, ns; // present state, next state

    // Clock Period 1.28 us
    // 46875000 correct value
    // Shorter Counter for testbench. Correct Timer for implementation
    generate
        if (test_mode)
            timer #(.WIDTH(6)) timer60s (.clk(clk), .reset(reset), .target(5'd30), .in(in), .hit_target(on60s));
        else
            timer #(.WIDTH(26)) timer60s (.clk(clk), .reset(reset), .target(26'd46875000), .in(in), .hit_target(on60s));
    endgenerate
    
    always_ff @(posedge clk) begin
        if (reset) ps <= s_start;
        else ps <= ns;
    end

    always_comb begin
        case (ps)
            s_start: ns = in ? s_timer : s_start; // Equivalent: if (ns == 1'b1) s_timer; else s_start;
            s_timer: ns = on60s? s_done : s_timer;
            s_done: ns = s_done;
        endcase
    end

    assign hit_target = (ps == s_start) | (ps == s_done);

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
        reset <= 1'b1; in <= 1'b0; @(posedge clk);
        reset <= 1'b0;
        repeat(100) @(posedge clk);
        in <= 1'b1;
        repeat (100) @(posedge clk);
        in <= 1'b0;
        repeat (100) @(posedge clk);
        $stop;
    end

endmodule