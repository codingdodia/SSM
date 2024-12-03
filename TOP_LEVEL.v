module top_level()

wire [15:0] bus;
reg [5:0] register_addr
input clock, reset;
input [15:0] instruction;
input bus_register_input_en, bus_register_ouput_en;

Register registers(
    .register_clock(clock),
    .register_reset(reset),
    .register_addr(register_addr),
    .bus_register_input(bus),
    .bus_register_output(bus),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_output_end(bus_register_ouput_en)
);




