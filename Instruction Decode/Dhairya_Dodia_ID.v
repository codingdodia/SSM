module ID(
    input ID_clock,
    input ID_reset,
    input [15:0] ID_instruction,
    output reg [3:0] opcode,
    output reg [5:0] parameter1,
    output reg [5:0] parameter2,
);


always@(posedge ID_clock) begin

    if(ID_reset) begin
        opcode <= 4'b0;
        parameter1 <= 6'b0;
        parameter2 <= 6'b0;
    end

    else begin
        opcode <= ID_instruction[15:12];
        parameter1 <= ID_instruction[11:6];
        parameter2 <= ID_instruction[5:0];
    end

end


endmodule

