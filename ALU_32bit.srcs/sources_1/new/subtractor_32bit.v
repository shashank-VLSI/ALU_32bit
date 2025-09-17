`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 14:38:10
// Design Name: 
// Module Name: subtractor_32bit
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


module subtractor_32bit(a,b,c,cout,pos,neg);
input [31:0] a,b;
output [31:0]c;
output cout,pos,neg;
wire [31:0]c1;
wire cout1;
adder_32bit A(a,~b,1,c1,cout1);
assign pos=cout1;
assign neg=~cout1;
wire not_cout;
assign not_cout=~cout1;
wire [31:0]c2;
mux2to1 B(c1,~c1,not_cout,c2);
adder_32bit C(c2,0,not_cout,c,cout);
endmodule
