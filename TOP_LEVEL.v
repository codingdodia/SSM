`timescale 1ns/1ns

module aa_top_level;

wire [15:0] bus;
wire [5:0] register_addr;
reg clock, reset;
wire [15:0] instruction;
wire bus_register_input_en, bus_register_ouput_en;
reg [3:0] FSM_start;
reg [3:0] opcode;
reg [5:0] param1, param2;
wire latched_bus1_en, latched_bus2_en, alu_bus_out_en;
wire [3:0] alu_control;
wire I0_bus_input_en, I0_bus_output_en;
reg DONE;
wire ALU_FSM_DONE, MOVE_FSM_DONE, ALUI_FSM_DONE, MOVI_FSM_DONE, STORE_FSM_DONE, LOAD_FSM_DONE;
reg [15:0] ID_instruction;



Register registers(
    .register_clock(clock),
    .register_reset(reset),
    .register_addr(register_addr),
    .bus_register_input(bus),
    .bus_register_output(bus),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_ouput_en)
);

ALU_FSM ALU_FSM_TOP_LEVEL(
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
    .alu_control(alu_control),
    .I0_bus_input_en(I0_bus_input_en),
    .I0_bus_output_en(I0_bus_output_en),
    .done(ALU_FSM_DONE)
);


ALU ALU_TOP_LEVEL(
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .reset(reset),
    .bus_in(bus),
    .control(alu_control),
    .bus_out_en(alu_bus_out_en),
    .bus_out(bus)
);

// ID ID_TOP_LEVEL(
//     .ID_clock(clock),
//     .ID_reset(reset),
//     .ID_instruction(ID_instruction),
//     .opcode(opcode),
//     .parameter1(param1),
//     .parameter2(param2)
// );

always #10 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    //ID_instruction = 16'b0001000001000001;

    #20
    reset = 0;
    opcode = 4'b0;
    param1 = 6'b0;
    param2 = 6'b000001;

    #5
    FSM_start = 4'b0;


    #10 
    FSM_start = 4'b1111;
    
end


endmodule