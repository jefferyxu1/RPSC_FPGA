module special_60s_timer(clk, reset, in, hit_target);
    input logic clk, reset, in;
    output logic hit_target;

    logic on60s;

    localparam [1:0]
        s_start = 2'b00,
        s_timer = 2'b01,
        s_done = 2'b10;

    logic [1:0] ps, ns; // present state, next state

    // Clock Period 1.28 us
    //timer #(.WIDTH(26)) timer60s (.clk(clk), .reset(reset), .target(26'd67108864), .in(in), .hit_target(on60s));

    // Shorter Counter for testbench, instantiate this one and comment the previous one when testbenching
    timer #(.WIDTH(6)) timer60s (.clk(clk), .reset(reset), .target(6'd60), .in(in), .hit_target(on60s));

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