`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 14:46:41
// Design Name: 
// Module Name: ALU
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


module ALU(a, b, opcode, result, cout, pos, neg,en);
  input  [31:0] a, b;
  input  [2:0] opcode;       // 00 = Add, 01 = Sub, 10 = Inc, 11 = Dec
  input en;
  output reg [31:0] result;
  output reg cout, pos, neg;

  wire [31:0] add_res, sub_res, inc_res, dec_res;
  wire add_cout, sub_cout, inc_cout, dec_cout;
  wire sub_pos, sub_neg;

  // Instantiate adders/subtractor
  adder_32bit      ADD (a, b, 1'b0, add_res, add_cout);
  subtractor_32bit SUB (a, b, sub_res, sub_cout, sub_pos, sub_neg);
  adder_32bit      INC (a, 32'b0, 1'b1, inc_res, inc_cout);       // a + 1
  subtractor_32bit DEC (a, 32'd1, dec_res, dec_cout, , );         // a - 1

  // Opcode mapping
  parameter add=3'b000, sub=3'b001, inc=3'b010, dec=3'b011, 
  true=3'b100, complement=3'b101, 
  logic_or=3'b110, logic_and=3'b111;

  always @(*) begin
  if(!en) begin         result =0;
        cout   = 0;
        pos    = 0;
        neg    = 0;
        end
   else begin
    case (opcode)
      add: begin   // Addition
        result = add_res;
        cout   = add_cout;
        pos    = 0;
        neg    = 0;
      end

      sub: begin   // Subtraction
        result = sub_res;
        cout   = sub_cout;
        pos    = sub_pos;
        neg    = sub_neg;
      end

      inc: begin   // Increment
        result = inc_res;
        cout   = inc_cout;
        pos    = 0;
        neg    = 0;
      end

      dec: begin   // Decrement
        result = dec_res;
        cout   = dec_cout;
        pos    = 0;
        neg    = 0;
      end
      
      true: begin   // true
        result = a;
        cout   = 0;
        pos    = 0;
        neg    = 0;
      end
      
      complement:begin   // complement
        result = ~a;
        cout   = 0;
        pos    = 0;
        neg    = 0;
      end
      
      logic_or:begin   // logic_or
        result = a|b;
        cout   = 0;
        pos    = 0;
        neg    = 0;
      end
      
      logic_and:begin   // logic_and
        result = a&b;
        cout   = 0;
        pos    = 0;
        neg    = 0;
      end
    endcase
    end
  end
endmodule



