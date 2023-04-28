module lampEncoder(clk, reset, lamp_in, encoder_out, enable);
    input logic clk, reset;
    input logic [15:0] lamp_in;
    output logic [3:0] encoder_out;
    output logic enable;

    logic [3:0] counter;

    always_ff @(posedge clk) begin
        if (reset) counter <= 4'd0;
        else counter <= counter + 4'd1;
    end

    always_comb begin
        case (counter)
            4'd0: if (lamp_in[0]) enable = 1'b1; else enable = 1'b0;
            4'd1: if (lamp_in[1]) enable = 1'b1; else enable = 1'b0;
            4'd2: if (lamp_in[2]) enable = 1'b1; else enable = 1'b0;
            4'd3: if (lamp_in[3]) enable = 1'b1; else enable = 1'b0;
            4'd4: if (lamp_in[4]) enable = 1'b1; else enable = 1'b0;
            4'd5: if (lamp_in[5]) enable = 1'b1; else enable = 1'b0;
            4'd6: if (lamp_in[6]) enable = 1'b1; else enable = 1'b0;
            4'd7: if (lamp_in[7]) enable = 1'b1; else enable = 1'b0;
            4'd8: if (lamp_in[8]) enable = 1'b1; else enable = 1'b0;
            4'd9: if (lamp_in[9]) enable = 1'b1; else enable = 1'b0;
            4'd10: if (lamp_in[10]) enable = 1'b1; else enable = 1'b0;
            4'd11: if (lamp_in[11]) enable = 1'b1; else enable = 1'b0;
            4'd12: if (lamp_in[12]) enable = 1'b1; else enable = 1'b0;
            4'd13: if (lamp_in[13]) enable = 1'b1; else enable = 1'b0;
            4'd14: if (lamp_in[14]) enable = 1'b1; else enable = 1'b0;
            4'd15: if (lamp_in[15]) enable = 1'b1; else enable = 1'b0;
        endcase
    end

    assign encoder_out = counter;
endmodule

module lampEncoder_testbench();
    logic clk, reset;
    logic [15:0] lamp_in;
    logic [3:0] encoder_out;
    logic enable;

    lampEncoder dut (.*);

    parameter CLOCK_PERIOD = 20;
    integer i; // labeling case number
        
    assign lamp_in = 16'b0000_1111_1010_0101;
    // simulated clock
    initial begin
        clk <= 0;
        forever #(CLOCK_PERIOD/2) clk <= ~clk;
    end

    initial begin
        reset <= 1'b1; @(posedge clk);
        reset <= 1'b0; i=0; @(posedge clk);
        repeat (100) begin
            i += 1;
            @(posedge clk);
        end
        $stop;
    end
endmodule