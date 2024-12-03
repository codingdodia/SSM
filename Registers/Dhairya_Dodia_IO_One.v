module IO_One(
    input I1_clock,
    input I1_reset,
    input external_I1_input_en,
    input [15:0] external_I1_input,
    input bus_I1_output_en,
    output [15:0] bus_I1_output
);


reg [15:0] I1_data;

always@(posedge I1_clock) begin
    
    if(I1_reset) begin
        I1_data <= 16'b0;
    end

    else if(external_I1_input_en) begin
        I1_data <= external_I1_input;
    end

end

tri_state_buffer I1_bus_tri_state(
    .data_in(I1_data),
    .enable(bus_I1_output_en),
    .data_out(bus_I1_output)
);

endmodule