`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:44 04/09/2019 
// Design Name: 
// Module Name:    RISC_8bit 
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
module RISC_8bit(input clk , output reg[7:0] led , input [7:0] sw
    );
wire jump_neq,rom_read,rom_write,alu_select,sel_dst_reg,rom_to_reg,write_reg,write_strobe,read_strobe;
 wire[1:0] output_ALU;
 wire [2:0] opcode;
 wire [7:0] output_port;
 reg [7:0] input_port;

 initial
 begin
 input_port <= 8'b0;
 led <= 8'b0;
 end
 
 always @ (posedge clk) begin
 input_port <= sw;
 end
 
  Control_Unit Control_Path
 ( 
  .opcode(opcode),
  .output_ALU(output_ALU),
  .sel_dst_reg(sel_dst_reg),
  .rom_to_reg(rom_to_reg),
  .write_reg(write_reg),
  .jump_neq(jump_neq),
  .rom_read(rom_read),
  .rom_write(rom_write),
  .alu_select(alu_select),
  .write_strobe(write_strobe),
  .read_strobe(read_strobe)
 );
 
 Datapath_Unit Data_Path
 (
  .clk(clk),
  .opcode(opcode),
  .output_port(output_port),
  .input_port(input_port),
  .write_strobe(write_strobe),
  .read_strobe(read_strobe),
  .rom_read(rom_read),
  .rom_write(rom_write),
  .alu_select(alu_select),
  .sel_dst_reg(sel_dst_reg),
  .rom_to_reg(rom_to_reg),
  .write_reg(write_reg),
  .jump_neq(jump_neq),
  .output_ALU(output_ALU)
 );
 
 always @ (posedge clk) begin
 if (write_strobe == 1'b1) begin
 led <= output_port;
 end
 end
endmodule

