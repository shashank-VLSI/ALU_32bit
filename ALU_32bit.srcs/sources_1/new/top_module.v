`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 00:03:20
// Design Name: 
// Module Name: top_module
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


module top_module(a, b, opcode, result, cout, pos, neg,en);
  input  [31:0] a, b;
  input  [2:0] opcode;       // 00 = Add, 01 = Sub, 10 = Inc, 11 = Dec
  input en;
  output [31:0] result;
  output cout, pos, neg;
  
ALU ALU(a, b, opcode, result, cout, pos, neg,en);
endmodule
