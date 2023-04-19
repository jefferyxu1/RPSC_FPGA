module FF (out, LA, in, reset, LA_Test, clk);
    input logic in, reset, LA_Test, clk;
    output logic out, LA;

    assign LA = out | LA_Test;

    always_ff @(posedge clk) begin
        if (reset)
            out <= 1'b0;
        else
            out <= ~in;
    end

endmodule