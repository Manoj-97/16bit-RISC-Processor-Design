`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:23 04/09/2019 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory(
 input clk,
 input [7:0]   rom_address,
 input [7:0]   rom_write_data,
 input rom_write,
 input rom_read,
 output [7:0]  rom_data
    );
	 
 reg [7:0] memory [7:0];
wire [2:0] location=rom_address[2:0];

initial
 begin
 memory [0] = 8'b00001010;
 memory [1] = 8'b11111111;
 memory [2] = 8'b00000001;
 memory [3] = 8'b00000001;
 memory [4] = 8'b00000000;
 memory [5] = 8'b00000000;
 memory [6] = 8'b00000000;
 memory [7] = 8'b00000000;
 end
 
 always @(posedge clk) begin
  if (rom_write)
   memory[location] <= rom_write_data;
 end
 assign rom_data = (rom_read==1'b1) ? memory[location]: 8'd0; 

endmodule

