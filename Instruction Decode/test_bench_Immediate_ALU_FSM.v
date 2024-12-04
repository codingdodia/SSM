module aa_FSM_Immediate_ALU_tb;

    reg clock;
    reg reset;
    reg FSM_start;
    reg [3:0] opcode;
    reg [5:0] param1;
    reg [15:0] immediate;
    wire [15:0] FSM_bus_output;
    wire bus_register_input_en;
    wire bus_register_out_en;
    wire [5:0] register_addr;
    wire latched_bus1_en;
    wire latched_bus2_en;
    wire alu_bus_out_en;
    wire [3:0] alu_control;
    wire done;
    wire immediate_en;

    // Clock generation
    always #5 clock = ~clock;

    // Instantiate the FSM_Immediate_ALU module
    ALU_Immediate uut (
        .clock(clock),
        .reset(reset),
        .FSM_start(FSM_start),
        .opcode(opcode),
        .param1(param1),
        .bus_register_input_en(bus_register_input_en),
        .bus_register_out_en(bus_register_out_en),
        .register_addr(register_addr),
        .latched_bus1_en(latched_bus1_en),
        .latched_bus2_en(latched_bus2_en),
        .alu_bus_out_en(alu_bus_out_en),
        .alu_control(alu_control),
        .done(done),
        .FSM_bus_output(FSM_bus_output)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        FSM_start = 0;
        opcode = 4'b0001; // Example opcode
        param1 = 6'b000001;
        param2 = 6'b000010;

        // Apply reset
        #10;
        reset = 0;

        // Start the FSM
        #10;
        FSM_start = 1;
        #10;
        FSM_start = 0;

        // Wait for the FSM to complete
        wait(done);

        // Check results
        // Add assertions or checks here if needed

        // Finish simulation
        $finish;
    end

endmodule