`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:35 04/09/2019 
// Design Name: 
// Module Name:    Register
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
module Register(
  input clk,
  input    write_reg,
  input  [2:0] dest_reg,
  input  [7:0] dest_reg_data,
  input  [7:0] dest_reg_data2,
  input  [2:0] input_addr_reg1,
  output  [7:0] input_data_reg1,
  input  [2:0] input_addr_reg2,
  output  [7:0] input_data_reg2,
  input read_strobe
    );
	 
  integer i;
  reg [7:0] reg_memory [7:0];

 initial begin
  for(i=0;i<8;i=i+1)
   reg_memory[i] <= 8'd0;
 end
 
 always @ (posedge clk ) begin
   if(write_reg) begin
    reg_memory[dest_reg] <= dest_reg_data;
   end
	else if(read_strobe) begin
	reg_memory[dest_reg] <= dest_reg_data2;
	end
 end
 
 assign input_data_reg1 = reg_memory[input_addr_reg1];
 assign input_data_reg2 = reg_memory[input_addr_reg2];
 
endmodule

