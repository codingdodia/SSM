`timescale 1ns/1ns

module aa_top_level;

wire [15:0] bus;
wire [5:0] register_addr;
reg clock, reset;

wire bus_register_input_en, bus_register_output_en;

wire [15:0] instruction;
wire [3:0] FSM_start;
wire [3:0] opcode;
wire [5:0] param1, param2;

wire latched_bus1_en, latched_bus2_en, alu_bus_out_en;
wire [3:0] alu_control;

wire I0_bus_input_en, I0_bus_output_en, I1_bus_output_en;

wire ALU_FSM_DONE, MOV_FSM_DONE, ALUI_FSM_DONE, MOVI_FSM_DONE, STORE_FSM_DONE, LOAD_FSM_DONE;
wire [15:0] ID_instruction;

wire [15:0] reg1_data,reg2_data,reg3_data,reg4_data;

wire [15:0] latched1_data, latched2_data, alu_result;

wire [15:0] external_data_in, external_data_out;

wire R_W, EN, MFC;

wire pc_out_en, pc_increment_en;
wire MAR_address_in_en;
wire MDR_bus_data_in, MDR_bus_data_out_en;
reg Instruction_fetch_START;
wire IR_in_en;

wire [15:0] MDR_memory_data_in, MDR_memory_data_out;
wire [15:0] MAR_memory_address_in;
wire [15:0] MAR_internal_data;


reg DONE;

Memory Memory_TOP_LEVEL(
    .dataout(MDR_memory_data_out),
    .MFC(MFC),
    .EN(EN),
    .addr(MAR_memory_address_in),
    .datain(MDR_memory_data_in),
    .RW(R_W)
);

MDR MDR_TOP_LEVEL(
    .MDR_clock(clock),
    .MDR_reset(reset),
    .MDR_bus_data_in_en(MDR_bus_data_in_en),
    .MDR_bus_data_in(bus),
    .MDR_bus_data_out(bus),
    .MDR_bus_data_out_en(MDR_bus_data_out_en),
    .MDR_data_from_memory(MDR_memory_data_out),
    .MDR_data_to_memory(MDR_memory_data_in)
);

MAR MAR_TOP_LEVEL(
    .MAR_clock(clock),
    .MAR_reset(reset),
    .address_in_en(MAR_address_in_en),
    .MAR_address_in(bus),
    .MAR_address_out(MAR_memory_address_in),
    .MAR_data(MAR_internal_data)
);

PC PC_TOP_LEVEL(
    .PC_clock(clock),
    .PC_reset(reset),
    .PC_increment(pc_increment_en),
    .PC_output_en(pc_out_en),
    .PC_address_out(bus)
);

IO_Zero IO_Zero_TOP_LEVEL(
    .I0_clock(clock),
    .I0_reset(reset),
    .bus_I0_input(bus),
    .bus_I0_input_en(bus_I0_input_en),
    .bus_I0_output(bus),
    .bus_I0_output_en(I0_bus_output_en),
    .external_I0_output(external_data_out)
);

IO_One IO_One_TOP_LEVEL(
    .I1_clock(clock),
    .I1_reset(reset),
    .external_I1_input(external_data_in),
    .bus_I1_output_en(I1_bus_output_en),
    .bus_I1_output(bus)
);

Instruction_fetch Instruction_fetch_TOP_LEVEL(
    .clock(clock),
    .reset(reset),
    .opcode(opcode),
    .R_W(R_W),
    .EN(EN),
    .MFC(MFC),
    .pc_out_en(pc_out_en),
    .pc_increment_en(pc_increment_en),
    .MAR_address_in_en(MAR_address_in_en),
    .MDR_bus_data_out_en(MDR_bus_data_out_en),
    .DONE(DONE),
    .START(Instruction_fetch_START),
    .IR_in_en(IR_in_en),
    .FSM_start(FSM_start)
);

IR IR_TOP_LEVEL(
    .clock(clock),
    .reset(reset),
    .IR_in_en(IR_in_en),
    .instruction_in(bus),
    .instruction_to_ID(ID_instruction)
);

Register registers(
    .register_clock(clock),
    .register_reset(reset),
    .register_addr(register_addr),
    .bus_register_input(bus),
    .bus_register_output(bus),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_output_en),
    .reg1_data(reg1_data),
    .reg2_data(reg2_data),
    .reg3_data(reg3_data),
    .reg4_data(reg4_data)
);

ALU_FSM ALU_FSM_TOP_LEVEL(
    .clock(clock),
    .reset(reset),
    .FSM_start(FSM_start),
    .opcode(opcode),
    .param1(param1),
    .param2(param2),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_output_en),
    .register_addr(register_addr),
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .alu_bus_out_en(alu_bus_out_en),
    .alu_control(alu_control),
    .I0_bus_input_en(I0_bus_input_en),
    .I0_bus_output_en(I0_bus_output_en),
    .I1_bus_output_en(I1_bus_output_en),
    .done(ALU_FSM_DONE)
);


ALU ALU_TOP_LEVEL(
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .reset(reset),
    .bus_in(bus),
    .control(alu_control),
    .bus_out_en(alu_bus_out_en),
    .bus_out(bus),
    .latched_bus1_in(latched1_data),
    .latched_bus2_in(latched2_data),
    .alu_result(alu_result)
);

ID ID_TOP_LEVEL(
    .ID_clock(clock),
    .ID_reset(reset),
    .ID_instruction(ID_instruction),
    .opcode(opcode),
    .parameter1(param1),
    .parameter2(param2)
);

ALU_Immediate ALU_Immediate_TOP_LEVEL(
    .clock(clock),
    .reset(reset),
    .FSM_start(FSM_start),
    .opcode(opcode),
    .param1(param1),
    .immediate(param2),
    .FSM_bus_output(bus),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_output_en),
    .register_addr(register_addr),
    .latched_bus1_en(latched_bus1_en),
    .latched_bus2_en(latched_bus2_en),
    .alu_bus_out_en(alu_bus_out_en),
    .alu_control(alu_control),
    .done(ALUI_FSM_DONE)
);

MOV_FSM MOV_FSM_TOP_LEVEL(
    .clock(clock),
    .reset(reset),
    .FSM_start(FSM_start),
    .source(param2),
    .dest(param1),
    .register_addr(register_addr),
    .bus_register_input_en(bus_register_input_en),
    .bus_register_out_en(bus_register_output_en),
    .I0_bus_input_en(I0_bus_input_en),
    .I0_bus_output_en(I0_bus_output_en),
    .I1_bus_output_en(I1_bus_output_en),
    .done(MOV_FSM_DONE)
);

always #10 clock = ~clock;

always@(*) begin
    if(ALU_FSM_DONE || ALUI_FSM_DONE || MOV_FSM_DONE || MOVI_FSM_DONE || STORE_FSM_DONE || LOAD_FSM_DONE) begin
        DONE = 1'b1;
        
    end else begin

        #30
        DONE = 1'b0;
    end
end

initial begin
    clock = 0;
    reset = 1;

    #20
    reset = 0;
    Instruction_fetch_START = 1;

    #25 Instruction_fetch_START = 0;







    
end


endmodule