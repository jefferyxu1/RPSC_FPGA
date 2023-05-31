`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:02:30 PM
// Design Name: 
// Module Name: Uart8
module Uart8  #(
    parameter CLOCK_RATE = 100000000, // board internal clock
    parameter BAUD_RATE = 115200
)(
    input wire clk,

    // tx interface
    output wire tx
);
wire txDone;
reg txStart;
reg [15:0] count = 0;
reg [7:0] in = 0;
wire rxClk;
wire txClk; 

reg txDone1;

always @(posedge clk) begin
    txDone1 <= txDone;
end

always @(posedge txDone1) begin
    in <= in + 1;
end

BaudRateGenerator #(
    .CLOCK_RATE(CLOCK_RATE),
    .BAUD_RATE(BAUD_RATE)
) generatorInst (
    .clk(clk),
    .rxClk(rxClk),
    .txClk(txClk)
);

always @(posedge txClk) begin
    count <= count + 1;
    if (count == 16'hFFFF) begin
        txStart <= 1;
    end else txStart <= 0;
end

Uart8Transmitter txInst (
    .clk(txClk),
    .en(1'b1),
    .start(txStart),
    .in(in),
    .out(tx),
    .done(txDone),
    .busy()
);

endmodule