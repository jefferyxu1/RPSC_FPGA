module timer #(parameter WIDTH = 8) (clk, reset, target, in, hit_target);
    input logic clk, reset, in;
    input logic [WIDTH-1:0] target;
    output logic hit_target;

    logic hit;
    logic [WIDTH-1:0] reg_count = 0;
    
    always_ff @(posedge clk) begin
        if (reset | (~in)) begin
            reg_count <= 0;
            hit <= 1'b0;
        end
        else if (reg_count == target) begin
            reg_count <= reg_count;
            hit <= 1'b1;
        end
        else begin
            reg_count <= reg_count + 1;
            hit <= 1'b0;
        end
    end

    assign hit_target = hit;

endmodule

module timer_testbench();
    logic clk, reset, in, hit_target;
    
    timer #(.WIDTH(4)) dut (.clk(clk), .reset(reset), .target(4'd15), .in(in), .hit_target(hit_target));

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
        reset <= 1'b1; in <= 1'b0; @(posedge clk);
        reset <= 1'b0; @(posedge clk);
        repeat (10) @(posedge clk);
        in <= 1'b1;
        repeat (20) @(posedge clk);
        in <= 1'b0; @(posedge clk);
        in <= 1'b1;
        repeat (20) @(posedge clk);
        $stop;
    end

endmodule