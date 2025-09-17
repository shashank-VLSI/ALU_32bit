`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 15:54:36
// Design Name: 
// Module Name: tb_ALU
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


`timescale 1ns/1ps

module tb_ALU;
  reg  [31:0] a, b;
  reg  [2:0] opcode;
  reg en;
  wire [31:0] result;
  wire cout, pos, neg;

  // Instantiate ALU
  ALU uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .cout(cout),
    .pos(pos),
    .neg(neg),.en(en)
  );

  initial begin
    // Monitor outputs
    $monitor("Time=%0t | opcode=%b | a=%d | b=%d | result=%d | cout=%b | pos=%b | neg=%b", 
              $time, opcode, a, b, result, cout, pos, neg);
    // Initialize inputs
    a = 10; b = 5;

    // Test all operations
    opcode = 3'b000; #10; // Add
    opcode = 3'b001; #10; // Sub
    opcode = 3'b010; #10; // Inc
    opcode = 3'b011; #10; // Dec
    opcode = 3'b100; #10; // True
    opcode = 3'b101; #10; // Complement
    opcode = 3'b110; #10; // Logic OR
    opcode = 3'b111; #10; // Logic AND

    // Finish simulation
    #20 $finish;
  end
  
  initial begin 
  en=0;#5 en=1;
  end
endmodule

