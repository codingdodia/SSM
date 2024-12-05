module MOV_Immediate_FSM_tb;

    reg clock;
    reg reset;
    reg FSM_start;
    reg [5:0] param1;
    reg [5:0] param2;
    wire p1isReg;
    wire p1isI0;
    wire p1isI1;
    wire p2isReg;
    wire p2isI0;
    wire p2isI1;
    wire bus_register_out_en;
    wire bus_register_input_en;
    wire [5:0] register_addr;
    wire I0_bus_output_en;
    wire I0_bus_input_en;
    wire I1_bus_output_en;
    wire [15:0] FSM_MOV_immediate_bus_output;
    wire done;

    // Clock generation
    always #5 clock = ~clock;

    // Instantiate the MOV_FSM module
    MOV_FSM uut (
        .clock(clock),
        .reset(reset),
        .FSM_start(FSM_start),
        .source(param2),
        .dest(param1),
        .register_addr(register_addr),
        .bus_register_out_en(bus_register_out_en),
        .bus_register_input_en(bus_register_input_en),
        .I0_bus_output_en(I0_bus_output_en),
        .I0_bus_input_en(I0_bus_input_en),
        .I1_bus_output_en(I1_bus_output_en),
        .FSM_MOV_immediate_bus_output(FSM_MOV_immediate_bus_output),
        .done(done)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        FSM_start = 4'b0000;
        param1 = 6'b000001;
        param2 = 6'b111000;

        // Apply reset
        #10;
        reset = 0;

        // Start the FSM
        #10;
        FSM_start = 4'b0011;
        #10;
        FSM_start = 4'b0000;

        // Wait for the FSM to complete
        wait(done);

        // Check results
        // Add assertions or checks here if needed


    end

endmodule