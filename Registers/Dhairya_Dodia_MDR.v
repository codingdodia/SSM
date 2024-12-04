module MDR(
    input MDR_clock,
    input MDR_reset,
    input [15:0] MDR_bus_data_in,
    output reg [15:0] MDR_bus_data_out,
    input MDR_bus_out_en,
    input [15:0] MDR_data_from_memory,
    output reg [15:0] MDR_data_to_memory
);


reg [15:0] MDR_data;

always @(posedge MDR_clock) begin
    if (MDR_reset) begin
        MDR_data <= 16'b0;
    end else begin
        MDR_data_to_memory <= MDR_bus_data_in;
    end
end



tri_state_buffer MDR (
    .data_in(MDR_data_from_memory)
    .enable(MDR_bus_out_en),
    .data_out(MDR_bus_data_out)
)

Memory MDR(
    .dataout(MDR_data_from_memory)
    .datain(data_to_memory)
)

endmodule