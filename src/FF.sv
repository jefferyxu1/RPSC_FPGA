module FF #(parameter initial_low = 0) (out, LA, in, reset, LA_Test, clk);
    input logic in, reset, LA_Test, clk;
    output logic out, LA;

    logic out_intermediate;
    
    assign LA = out | LA_Test;

    always_ff @(posedge clk) begin
        if (reset)
            out_intermediate <= ~in;
        else
            out_intermediate <= ~in;
    end
    
    logic reset_first_time;
    initial reset_first_time = 1'b0;

    generate
        if (initial_low) begin
    
            always_ff @(posedge clk) begin
                if (reset)
                    reset_first_time <= 1'b1;
                else 
                    reset_first_time <= reset_first_time;
            end

            assign out = reset_first_time ? out_intermediate : 1'b0;
        end
        else
            assign out = out_intermediate;
    endgenerate

endmodule