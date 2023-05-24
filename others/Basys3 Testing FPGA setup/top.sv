`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2023 02:36:44 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(sw, LED, JA, JB, JC);
    input logic [15:0] sw;
    input logic [7:0] JB, JC;
    output logic [15:0] LED;
    output logic [7:0] JA;
    
    assign JA = sw[7:0];
    
    assign LED[7:0] = JC;
    assign LED[15:8] = JB;
    
endmodule
