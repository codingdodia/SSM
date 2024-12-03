module Register3(
    input register_clock,
    input register_reset,
    input [15:0] bus_register3_input,
    input bus_register3_input_en,
    output [15:0] bus_register3_output,
    input bus_register3_out_en
);

reg [15:0] register_data;

always@(posedge register_clock) begin

    if(register_reset) begin
        register_data <= 16'b0;
    end

    else if(bus_register3_input_en) begin
        register_data <= bus_register3_input;
    end
end

tri_state_buffer reg3_tri_state(
    .data_in(register_data),
    .enable(bus_register3_out_en),
    .data_out(bus_register3_output)
)