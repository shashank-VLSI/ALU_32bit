`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 14:56:35
// Design Name: 
// Module Name: increment
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


module increment(a,s,cout);
input [31:0]a;
output [31:0]s;output cout;
adder_32bit(a,32'b0, 1, s, cout);
endmodule
