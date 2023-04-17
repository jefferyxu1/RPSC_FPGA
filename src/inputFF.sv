module inputFF(clk, reset, out, in);
    input logic, clk, reset, in;
    output logic out;

    logic ff1;

    always_ff @(posedge clk) begin
        if (reset) begin
            ff1 <= 1'b0;
            out <= 1'b0;
        end
        else begin
            ff1 <= in;
            out <= ff1;
        end
    end

endmodule
