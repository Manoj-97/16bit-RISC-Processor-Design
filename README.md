# Processor-Design
The Goal of this project is to design an 8-bit RISC Processor which is capable of handling programs like the Fibonacci number calculator. 
The Designed processor is then implemented in a Spartan-6 FPGA. 
The input from the switches (in binary) will be used to find the nth Fibonacci Number, which is displayed in the 7-segments/LED's.
Files: ALU, control2, Data Memory, Instruction Memory, Registers, all come under Datapath Unit module
Files: Dathapath Unit and Controlpath Unit comes under Top module - RISC_8bit (Processor.v)
The Machine language for fibonacci is written and stored in instruction memory. Assembly version is commented
The values required for processing are stored in Data memory.
The Nexys3.ucf file is attached to Map the Input/Output, Clock to the Nexys3 board (Spartan-6 FPGA).
