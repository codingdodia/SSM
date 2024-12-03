module top_level()

wire [15:0] bus;
reg [5:0] register_addr
input clock, reset;
input [15:0] instruction;

Register registers()

