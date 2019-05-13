`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:18 04/09/2019 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
 input[15:0] pc,
 output[15:0] instruction
    );
	 
reg [15:0] memory [9:0];
 wire [3 : 0] location = pc[4 : 1];
 
 initial
 begin
 //memory [0] = 16'b0000010000000000;
 memory [0] = 16'b0100010001000010;  //LOAD R1, (R2+2) 
 memory [1] = 16'b0100010011000001;  //LOAD R3, (R2+1)
 memory [2] = 16'b0100010100000011; // LOAD R4, (R2+3)
 memory [3] = 16'b0100010101000100; // LOAD R5, (R2+4)
 memory [4] = 16'b0000000000000000; //INPUT R0
 memory [5] = 16'b1000001011001000; //ADD R1,R6
 memory [6] = 16'b1010001011011000; //SUB R3,R1
 memory [7] = 16'b1010000100000000; //SUB R0,R4
 memory [8] = 16'b1110000101111100; //JUMP NE R0,R5
 memory [9] = 16'b0010001000000000; //OUTPUT R1
 end
 assign instruction =  memory[location]; 

endmodule

