module MDR(
    input MDR_clock,
    input MDR_reset,
    input MDR_bus_data_in_en,
    input [15:0] MDR_bus_data_in,
    output reg [15:0] MDR_bus_data_out,
    input MDR_bus_data_out_en,
    input [15:0] MDR_data_from_memory,
    output reg [15:0] MDR_data_to_memory
);


reg [15:0] MDR_data_going_in;
reg [15:0] MDR_data_going_out;

always @(posedge MDR_clock) begin
    if (MDR_reset) begin
        MDR_data_going_in = 16'b0;
        MDR_data_going_out = 16'b0;
    end else if(MDR_bus_in_en)begin
        MDR_data_going_in = MDR_bus_data_in;
    end else begin
        MDR_data_going_out = MDR_data_from_memory;
        MDR_data_to_memory = MDR_data;
    end
end



tri_state_buffer MDR (
    .data_in(MDR_data_going_out),
    .enable(MDR_bus_data_out_en),
    .data_out(MDR_bus_data_out)
)


endmodule