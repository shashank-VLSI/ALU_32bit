`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 15:02:54
// Design Name: 
// Module Name: decrement
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


module decrement(clk, rst, a, cout, pos, neg);
  input clk, rst;
  output reg [31:0] a;   // A is storage
  output cout, pos, neg;

  wire [31:0] next_a;

  // Use subtractor to compute a - 1
  subtractor_32bit DEC (a, 32'd1, next_a, cout, pos, neg);

  always @(posedge clk or posedge rst) begin
    if (rst)
      a <= 32'd0;        // Reset A to 0
    else
      a <= next_a;       // Store decremented value back into A
  end
endmodule

