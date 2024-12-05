module Register(
    input register_clock,
    input register_reset,
    input [5:0]register_addr,
    input [15:0] bus_register_input,
    input bus_register_input_en,
    output [15:0] bus_register_output,
    input bus_register_out_en,

);

reg [15:0] register_data [3:0];
reg [15:0] selected_register_data;

always@(posedge register_clock) begin

    if(register_reset) begin
        register_data[0] <= 16'b0;
        register_data[1] <= 16'b01;
        register_data[2] <= 16'b10;
        register_data[3] <= 16'b11;
    end

    else if (bus_register_input_en) begin
        case (register_addr[5:0]) // Use only the lower 2 bits of the address
            2'b00: register_data[0] <= bus_register_input;
            2'b01: register_data[1] <= bus_register_input;
            2'b10: register_data[2] <= bus_register_input;
            2'b11: register_data[3] <= bus_register_input;
        endcase
    end

end

always @(*) begin
    case (register_addr[5:0])
        6'b00: selected_register_data = register_data[0];
        6'b01: selected_register_data = register_data[1];
        6'b10: selected_register_data = register_data[2];
        6'b11: selected_register_data = register_data[3];
        default: selected_register_data = 16'b0;
    endcase
end

tri_state_buffer register_tri_state(
    .data_in(selected_register_data),
    .enable(bus_register_out_en),
    .data_out(bus_register_output)
);

endmodule