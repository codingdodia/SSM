module aaIDTB();

    reg clock, reset
    reg [15:0] ID_instruction;
    wire [3:0] opcode;
    wire [5:0] param1;
    wire [5:0] param2;


    always #5 clk = ~clk;


    ID test(
        .ID_clock(clock),
        .ID_reset(reset),
        .ID_instruction(ID_instruction),
        .opcode(opcode),
        .parameter1(param1),
        .parameter2(param2)
    );

    initial begin
        // Initialize signals
        clock = 0;
        reset = 1;
        ID_instruction = 16'b0;

        // Apply reset
        #10;
        reset = 0;

        // Apply test vector
        ID_instruction = 16'b0001000001000001;
        #10;

        // Apply another test vector
        ID_instruction = 16'b0010001100110011;
        #10;

        // Finish simulation
        $finish;
    end
endmodule;