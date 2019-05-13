`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:41 04/09/2019 
// Design Name: 
// Module Name:    control2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control2(ALU_rep, ALUOpcodeX, Opcode);
output reg[1:0] ALU_rep;
 input [1:0] ALUOpcodeX;
 input [2:0] Opcode;
 wire [5:0] select;
 assign select = {ALUOpcodeX,Opcode};
 always @(select)
 casex (select)
   5'b00100: ALU_rep=2'b00;
   5'b00101: ALU_rep=2'b01;
   5'b00110: ALU_rep=2'b10;
   5'b10xxx: ALU_rep=2'b00;
   5'b01xxx: ALU_rep=2'b01;
	
  default: ALU_rep=2'b00;
  endcase
  
endmodule

