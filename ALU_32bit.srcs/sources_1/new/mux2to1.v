`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 14:39:51
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(I0,I1,S,Y);

input [31:0]I0,I1;
input S;

output [31:0]Y;

assign Y=S?I1:I0;

endmodule
