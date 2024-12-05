module IR(
    input clock,
    input reset,
    input IR_in_en,
    input [15:0] instruction_in,
    output [15:0] instruction_to_ID;
);

    reg [15:0] instruction_to_ID;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            instruction_to_ID <= 16'b0;
        end
        else if(IR_in_en) begin
            instruction_to_ID <= instruction_in;
        end
    end




endmodule