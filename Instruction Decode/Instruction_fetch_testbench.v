module aa_Instruction_fetch_tb;

    reg clock;
    reg reset;
    wire [3:0] FSM_start;
    reg [3:0] opcode;
    wire pc_out_en, pc_increment;
    wire MAR_address_in_en;
    wire R_W, EN;
    reg MFC;
    wire MDR_bus_data_out_en;
    wire IR_in_en;
    reg DONE, START;

    // Clock generation
    always #5 clock = ~clock;

    // Instantiate the Instruction_fetch module
    Instruction_fetch uut (
        .clock(clock),
        .reset(reset),
        .opcode(opcode),
        .EN(EN),
        .R_W(R_W),
        .MFC(MFC),
        .pc_increment_en(pc_increment),
        .pc_out_en(pc_out_en),
        .MAR_address_in_en(MAR_address_in_en),
        .MDR_bus_data_out_en(MDR_bus_data_out_en),
        .DONE(DONE),
        .START(START),
        .IR_in_en(IR_in_en),
        .FSM_start(FSM_start)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        START = 0;

        // Apply reset
        #10;
        reset = 0;

        // Start the FSM
        #10;
        START = 1;
        #10;
        
        MFC = 1;
        opcode = 4'b0001;



        // Wait for the FSM to complete

        // Check results
        // Add assertions or checks here if needed

    end

endmodule