module PC(
    input PC_clock,
    input PC_reset,
    input PC_increment,
    input PC_output_en,
    output [15:0] PC_address_out
);

reg [15:0] PC_reg;

always @(posedge PC_clock) begin
    if (PC_reset) begin
        PC_reg <= 16'b0;
    end else if (PC_increment) begin
        PC_reg <= PC_reg + 1;
    end
end

tri_state_buffer PC_tri_state (
    .data_in(PC_reg),
    .enable(PC_output_en),
    .data_out(PC_address_out)
);



endmodule