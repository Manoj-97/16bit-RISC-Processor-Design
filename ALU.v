`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:48 04/09/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU( input  [7:0] a, 
 input  [7:0] b,  
 input  [1:0] select, 
 
 output reg [7:0] Operation,  
 output zero
    );
always @(*)
begin 
 case(select)
 2'b00: Operation = a + b; 
 2'b01: Operation = a - b; 
 2'b10: Operation = ~a;
 
 default:Operation = a + b;
 endcase
end
assign zero = (Operation==8'd0) ? 1'b1: 1'b0;

endmodule

