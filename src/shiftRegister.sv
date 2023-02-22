module shiftRegister #(paramter N = 64) (on, in, reset, clk);
    input logic in, reset;
    output logic on;

    logic [N:0] regs;

    always_ff @(posedge clk) begin
        if (reset) begin
            genvar i;
            generate
                for (i = 0; i < N; i++)
                    regs[i] <= 1'b0;
            endgenerate
        end
        else begin
            genvar i;
            generate
                for (i = 1; i < N; i++)
                    regs[i] <= regs[i - 1];
            endgenerate

            regs[0] <= in;
        end
    end

    genvar i;
    generate
        for (i = 0; i < N - 1; i++)
            on = regs[i] & regs[i + 1]; 
    endgenerate
endmodule