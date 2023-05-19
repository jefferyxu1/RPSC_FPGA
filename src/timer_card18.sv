// The module replaces the delay circuit connects to card 18 Pin 12 and Pin 34
module timer_card18 (clk, reset, in, out);
    input logic clk, reset, in;
    output logic out;

    logic [1:0] FSMin;
    logic lowDelay, highDelay;
    assign FSMin = {lowDelay, highDelay};

    // Clk Period 1.28us
    timer #(.WIDTH(18)) highTimer (.clk(clk), .reset(reset), .target(18'd146875), .in(in), .hit_target(highDelay));
    timer #(.WIDTH(18)) lowTimer (.clk(clk), .reset(reset), .target(18'd146875), .in(~in), .hit_target(lowDelay));

    // For testing
    //timer #(.WIDTH(3)) highTimer (.clk(clk), .reset(reset), .target(3'd7), .in(in), .hit_target(highDelay));
    //timer #(.WIDTH(3)) lowTimer (.clk(clk), .reset(reset), .target(3'd7), .in(~in), .hit_target(lowDelay));

    localparam [1:0]
        s_start = 2'b00,
        s_low = 2'b01,
        s_high = 2'b10;

    logic [1:0] ps, ns;

    always_ff @(posedge clk) begin
        if (reset) ps <= s_start;
        else ps <= ns;
    end
    
    always_comb begin
        case(ps)
            s_start: if (FSMin == 2'b01) ns = s_high;
                     else if (FSMin == 2'b10) ns = s_low;
                     else ns = s_start;
            s_high: if (FSMin == 2'b10) ns = s_low;
                    else ns = s_high;
            s_low: if (FSMin == 2'b01) ns = s_high;
                   else ns = s_low;
        endcase
    end

    assign out = (ps == s_start) | (ps == s_high);
    
endmodule

module timer_card18_testbench();
    logic clk, reset, in, out;

    timer_card18 dut (.*);

    parameter CLOCK_PERIOD = 1000;
    integer i;
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    task inputHigh;
        in <= 1'b1; @(posedge clk);
    endtask

    task inputLow;
        in <= 1'b0; @(posedge clk);
    endtask

    task longtime;
        repeat (50) @(posedge clk);
    endtask

    initial begin
        reset <= 1'b1; in <= 1'b0; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        longtime;
        inputLow;
        inputHigh;
        inputLow;
        inputHigh;
        longtime;
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0;
        longtime;
        inputHigh;
        longtime;
        inputLow;
        longtime;
        inputHigh;
        inputLow;
        longtime;
        $stop;
    end

endmodule