`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:42 04/09/2019
// Design Name:   RISC
// Module Name:   /home/013/m/mx/mxv180000/Desktop/FPGA/test_Risc_16_bit.v
// Project Name:  FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg [7:0] sw;
   wire [7:0] led;
	// Instantiate the Unit Under Test (UUT)
	RISC_8bit uut (
		.clk(clk),.led(led),.sw(sw)
	);

	initial 
  begin
   clk <=0;
	sw <= 8'b00001010;
   #50;
   $finish;
  end

 always 
  begin
   #5 clk = ~clk;
  end
      
endmodule

