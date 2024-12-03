module MDR(
    input MDR_clock,
    input MDR_reset,
    input [15:0] data_in,
    output reg [15:0] MDR_bus_data_out,
    output reg [15:0] MDR_data_to_memory
);

reg [15:0] MDR_input_reg;
reg [15:0] MDR_output_reg;

always @(posedge MDR_clock) begin
    if (MDR_reset) begin
        MDR_input_reg <= 16'b0;
        MDR_output_reg <= 16'b0;
    end else begin
        MDR_input_reg <= data_in;
        MDR_output_reg <= MDR_input_reg;
    end
end

always @(posedge MDR_clock) begin
    if (MDR_reset) begin
        data_out <= 16'b0;
        data_to_memory <= 16'b0;
    end else begin
        data_out <= MDR_output_reg;
        data_to_memory <= MDR_input_reg;
    end
end

endmodule