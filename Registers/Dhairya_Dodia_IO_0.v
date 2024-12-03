module IO_Zero(
    input I0_clock,
    input I0_reset,
    input [15:0] bus_I0_input,
    input bus_IO_input_en,
    output [15:0] bus_I0_output,
    input bus_I0_output_en,
    output [15:0] external_IO_Zero_output,
    output external_IO_Zero_output_en
);

reg [15:0] I0_data;

always@(posedge IO_clock) begin
    
    if(IO_reset) begin
        I0_data;
    end

    else if(bus_IO_input_en) begin
        IO_data <= bus_IO_Zero_input;
    end

end

tri_state_buffer IO_Zero_bus_tri_state(
    .data_in(IO_data),
    .enable(bus_I0_output_en),
    .data_out(bus_I0_output)
);

tri_state_buffer IO_Zero_external_tri_state(
    .data_in(IO_data),
    .enable(external_IO_Zero_output_en),
    .data_out(external_IO_Zero_output)
);

endmodule