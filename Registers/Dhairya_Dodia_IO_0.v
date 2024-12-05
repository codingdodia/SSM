module IO_Zero(
    input I0_clock,
    input I0_reset,
    input [15:0] bus_I0_input,
    input bus_I0_input_en,
    output [15:0] bus_I0_output,
    input bus_I0_output_en,
    output reg [15:0] external_I0_output
);

reg [15:0] I0_data;

always@(posedge I0_clock) begin
    
    if(I0_reset) begin
        I0_data = 16'b0;
    end

    else if(bus_I0_input_en) begin
        I0_data = bus_I0_input;
    end

end

tri_state_buffer I0_bus_tri_state(
    .data_in(I0_data),
    .enable(bus_I0_output_en),
    .data_out(bus_I0_output)
);

always@(*) begin
    external_I0_output = I0_data;
end

endmodule