`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:38 04/09/2019 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(input[2:0] opcode,
      output reg[1:0] output_ALU,
      output reg jump_neq, //flow signals
		output reg rom_read,rom_write, // ROM management signals
		output reg alu_select,sel_dst_reg,rom_to_reg,write_reg, //register signals
		output reg write_strobe,read_strobe  //input/output signals
    );
always @(*)
begin
 case(opcode) 
  3'b000: //INPUT
   begin
	 write_strobe = 1'b0;
	 read_strobe = 1'b1;
	 sel_dst_reg = 1'b1;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b0;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b10;
	end
	
  3'b001: //OUTPUT
   begin
	 write_strobe = 1'b1;
	 read_strobe = 1'b0;
	 sel_dst_reg = 1'b0;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b1;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b10;
	end
	
 3'b010:  // LOAD
   begin
	 write_strobe = 1'b0;	 
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b0;
    alu_select = 1'b1;
    rom_to_reg = 1'b1;
    write_reg = 1'b1;
    rom_read = 1'b1;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b10;  
   end
	
 3'b011:  // STORE
   begin
    write_strobe = 1'b0;	 
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b0;
    alu_select = 1'b1;
    rom_to_reg = 1'b0;
    write_reg = 1'b0;
    rom_read = 1'b0;
    rom_write = 1'b1;
    jump_neq = 1'b0;
    output_ALU = 2'b10;
   end
	
 3'b100:  // ADD
   begin
    write_strobe = 1'b0;	 
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b1;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b1;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b00;
   end
	
 3'b101:  // SUB
   begin
	 write_strobe = 1'b0;	 
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b1;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b1;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b00;
   end
	
 3'b110:  // Invert
   begin
    write_strobe = 1'b0;	 
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b1;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b1;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b00;
   end
	
	
 3'b111:  // jump_neq
   begin
	 write_strobe = 1'b0;
    read_strobe = 1'b0;	
    sel_dst_reg = 1'b0;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b0;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b1;
    output_ALU = 2'b01; 
   end
	
 default: begin
 	 write_strobe = 1'b0;
	 read_strobe = 1'b0;
    sel_dst_reg = 1'b1;
    alu_select = 1'b0;
    rom_to_reg = 1'b0;
    write_reg = 1'b1;
    rom_read = 1'b0;
    rom_write = 1'b0;
    jump_neq = 1'b0;
    output_ALU = 2'b00;
   end
 endcase
 end
endmodule

