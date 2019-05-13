`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:47 04/09/2019 
// Design Name: 
// Module Name:    Datapath_Unit 
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
module Datapath_Unit(
 input clk,
 input jump_neq,write_strobe,read_strobe,rom_read,rom_write,alu_select,sel_dst_reg,rom_to_reg,write_reg,
 input[1:0] output_ALU,
 output[2:0] opcode,
 output[7:0] output_port,
 input [7:0] input_port
    );
	 
 wire [1:0] ALU_rep;
 wire [7:0] ALU_result;
 wire zero_flag;
 wire [15:0] PC_2jne,PC_jne;
 wire [12:0] jump_offset;
 wire [7:0] rom_data;
 
 wire [2:0] dest_reg,input_addr_reg1,input_addr_reg2;
 wire [7:0] dest_reg_data,dest_reg_data2,input_data_reg1,input_data_reg2;
 
 reg  [15:0] pc_current;
 wire [15:0] pc_next,pc2_next,instruction,extend,register2;
 
 initial begin
  pc_current <= 16'd0;
 end
 always @(posedge clk)
 begin 
   pc_current <= pc_next;
 end
 
 assign pc2_next = pc_current + 16'd2;
 assign opcode = instruction[15:13];
 
 Instruction_Memory ROM_INSTRUCTION(.pc(pc_current),.instruction(instruction));
  Data_Memory ROM_DATA
  (
   .clk(clk),.rom_address(ALU_result),.rom_write_data(input_data_reg2),
	.rom_write(rom_write),.rom_read(rom_read),.rom_data(rom_data)
  );
 control2 ALU_CONTROL(.ALUOpcodeX(output_ALU),.Opcode(instruction[15:13]),.ALU_rep(ALU_rep));
 ALU ALU(.a(input_data_reg1),.b(register2),.select(ALU_rep),.Operation(ALU_result),.zero(zero_flag));

 assign dest_reg = (sel_dst_reg==1'b1) ? instruction[5:3] :instruction[8:6];
 assign input_addr_reg1 = instruction[11:9];
 assign input_addr_reg2 = instruction[8:6];
 assign PC_jne = pc2_next + {extend[14:0],1'b0};
 assign jne_control = jump_neq & (~zero_flag);
 assign pc_next = (jne_control==1'b1) ? PC_jne : pc2_next;
 assign extend = {{10{instruction[5]}},instruction[5:0]};  
 assign register2 = (alu_select==1'b1) ? extend : input_data_reg2;
 assign dest_reg_data = (rom_to_reg == 1'b1)?  rom_data: ALU_result;
 
 Register REGISTERS
 (
  .clk(clk),.write_reg(write_reg),.dest_reg(dest_reg),.dest_reg_data(dest_reg_data),.dest_reg_data2(dest_reg_data2),
  .input_addr_reg1(input_addr_reg1),.input_data_reg1(input_data_reg1),.input_addr_reg2(input_addr_reg2),.input_data_reg2(input_data_reg2),
  .read_strobe(read_strobe)
 );
 
 assign output_port = (write_strobe == 1'b1)? input_data_reg1: 8'b00000000;
 assign dest_reg_data2 = (read_strobe == 1'b1)? input_port : 8'b00000000;

endmodule

