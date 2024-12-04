module aa_ALU_FSM_tb;

    reg clock;
    reg reset;
    reg FSM_start;
    reg [5:0] param1;
    reg [5:0] param2;
    reg [3:0] opcode;
    wire bus_register_input_en;
    wire bus_register_out_en;
    wire [5:0] register_addr;
    wire latched_bus1_en;
    wire latched_bus2_en;
    wire alu_bus_out_en;
    wire [3:0] alu_control;
    wire done;

    // Clock generation
    always #5 clock = ~clock;

    // Instantiate the ALU_FSM module
    ALU_FSM uut (
        .clock(clock),
        .reset(reset),
        .FSM_start(FSM_start),
        .param1(param1),
        .param2(param2),
        .opcode(opcode),
        .bus_register_input_en(bus_register_input_en),
        .bus_register_out_en(bus_register_out_en),
        .register_addr(register_addr),
        .latched_bus1_en(latched_bus1_en),
        .latched_bus2_en(latched_bus2_en),
        .alu_bus_out_en(alu_bus_out_en),
        .alu_control(alu_control),
        .done(done)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        FSM_start = 0;
        param1 = 6'b000001;
        param2 = 6'b000010;
        opcode = 4'b0001; // Example opcode

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
    end

endmodule