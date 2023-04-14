module shiftRegister #(parameter N = 4) (on, in, reset, clk);
    input logic in, clk, reset;
    output logic on;

    logic [N-1:0] regs;

    always_ff @(posedge clk) begin
        if (reset) begin
            regs <= {N{1'b0}};
        end
        else begin
            for (int i = 1; i < N; i++)
                regs[i] <= regs[i - 1];

            regs[0] <= in;
        end
    end

    assign on = &regs;

endmodule

module shiftRegister_testbench();
    logic in, clk, reset;
    logic on;

    shiftRegister dut (.*);

    parameter CLOCK_PERIOD = 1000;
    integer i;
    
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end // initial

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0;
        in <= 1'b1;
        repeat(4) @(posedge clk);
        in <= 1'b0; @(posedge clk);
        in <= 1'b1;
        repeat(5) @(posedge clk);
        $stop;
    end
endmodule