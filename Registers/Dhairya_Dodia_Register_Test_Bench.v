`timescale 1ns / 1ps

module Register_tb;

    // Inputs
    reg register_clock;
    reg register_reset;
    reg [15:0] bus_register_input;
    reg bus_register_input_en;

    // Outputs
    wire [15:0] bus_register_output;
    wire bus_register_out_en;

    // Instantiate the Unit Under Test (UUT)
    Register uut (
        .register_clock(register_clock),
        .register_reset(register_reset),
        .bus_register_input(bus_register_input),
        .bus_register_input_en(bus_register_input_en),
        .bus_register_output(bus_register_output),
        .bus_register_out_en(bus_register_out_en)
    );

    initial begin
        // Initialize Inputs
        register_clock = 0;
        register_reset = 0;
        bus_register_input = 0;
        bus_register_input_en = 0;

        // Wait for global reset
        #100;
        
        // Add stimulus here
        register_reset = 1;
        #10;
        register_reset = 0;
        bus_register_input = 16'hA5A5;
        bus_register_input_en = 1;
        #10;
        bus_register_input_en = 0;
    end

    always #5 register_clock = ~register_clock;

endmodule