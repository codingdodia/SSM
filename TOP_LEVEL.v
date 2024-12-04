module top_level()

wire [15:0] bus;
wire [5:0] register_addr
wire clock, reset;
wire [15:0] instruction;
wire bus_register_input_en, bus_register_ouput_en;
wire [3:0]FSM_start;
wire [3:0] opcode;
wire [5:0] param1;
wire [5:0] param2;
wire latched_bus1_en, latched_bus2_en, alu_bus_out_en;
wire [3:0] alu_control
wire I0_bus_input_en, I0_bus_output_en;
reg DONE;
wire ALU_FSM_DONE, MOVE_FSM_DONE, ALUI_FSM_DONE, MOVI_FSM_DONE, STORE_FSM_DONE, LOAD_FSM_DONE;


Register registers(
    .register_clock(clock),
    .register_reset(reset),
    .register_addr(register_addr),
    .bus_register_input(bus),
    .bus_register_output(bus),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_output_end(bus_register_ouput_en)
);

ALU_FSM(
    .clock(clock),
    .reset(reset),
    .FSM_start(FSM_start),
    .opcode(opcode),
    .param1(param1),
    .param2(param2),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_ouput_en),
    .register_addr(register_addr),
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .alu_bus_out_en(alu_bus_out_en),
    .alu_control(alu_contrl),
    .I0_bus_input_en(I0_bus_input_en),
    .I0_bus_output_en(I0_bus_output_en),
    .done(ALU_FSM_DONE)
);


ALU ALU_TOP_LEVEL(
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .ALU_clock(clock),
    .bus_in(bus),
    .control(alu_contrl),
    .bus_out_en(alu_bus_out_en),
    .bus_out(bus)
);
