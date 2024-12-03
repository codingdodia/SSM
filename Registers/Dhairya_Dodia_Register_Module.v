module Register(
    input register_clock,
    input register_reset,
    input [15:0] bus_register_input,
    input bus_register_input_en,
    output [15:0] bus_register_output,
    output bus_register_out_en
);


reg [15:0] register_data;

always@(posedge register_clock) begin

    if(register_reset) begin
        register_data <= 16'b0;
    end

    else if(bus_register_input_en) begin
        register_data <= bus_register_input
    end

end

tri_state_buffer register_tri_state(
    .data_in(register_data),
    .enable(bus_register_out_en),
    .data_out(bus_register_output)
)

endmodule