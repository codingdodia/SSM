module ID(
    input ID_clock,
    input ID_reset,
    input [15:0] ID_instruction,
    output reg [3:0] opcode,
    output reg [5:0] parameter1,
    output reg [5:0] parameter2
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


always @(*) begin
    case (opcode)
        4'b0000: begin
            // Handle opcode 0
        end
        4'b0001: begin
            // Handle opcode 1
        end
        4'b0010: begin
            // Handle opcode 2
        end
        4'b0011: begin
            // Handle opcode 3
        end
        4'b0100: begin
            // Handle opcode 4
        end
        4'b0101: begin
            // Handle opcode 5
        end
        4'b0110: begin
            // Handle opcode 6
        end
        4'b0111: begin
            // Handle opcode 7
        end
        4'b1000: begin
            // Handle opcode 8
        end
        4'b1001: begin
            // Handle opcode 9
        end
        4'b1010: begin
            // Handle opcode 10
        end
        4'b1011: begin
            // Handle opcode 11
        end
        4'b1100: begin
            // Handle opcode 12
        end
        default: begin
            opcode <= 4'b0;
        end
    endcase
end

endmodule

