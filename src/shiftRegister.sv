module shiftRegister #(parameter N = 64) (on, in, reset, clk);
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

    always_comb begin
        for (int i = 0; i < N - 1; i++)
            on = regs[i] & regs[i + 1];
    end
endmodule