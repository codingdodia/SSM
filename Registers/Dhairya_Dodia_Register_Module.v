module Register(
    input register_clock,
    input register_reset,
    input [5:0]register_addr,
    input [15:0] bus_register_input,
    input bus_register_input_en,
    output [15:0] bus_register_output,
    input bus_register_out_en,
    output reg [15:0] reg1_data,
    output reg [15:0] reg2_data,
    output reg [15:0] reg3_data,
    output reg [15:0] reg4_data
);

reg [15:0] register_data [3:0];
reg [15:0] selected_register_data;

always@(posedge register_clock) begin

    if(register_reset) begin
        register_data[0] = 16'b00;
        register_data[1] = 16'b01;
        register_data[2] = 16'b10;
        register_data[3] = 16'b11;

        reg1_data = register_data[0];
        reg2_data = register_data[1];
        reg3_data = register_data[2];
        reg4_data = register_data[3];
    end

    else if (bus_register_input_en) begin
        case (register_addr[5:0]) // Use only the lower 2 bits of the address
            6'b00: begin
                register_data[0] = bus_register_input;
                reg1_data = bus_register_input;
            end
            6'b01: begin
                register_data[1] = bus_register_input;
                reg2_data = bus_register_input;
            end
            6'b10: begin
                register_data[2] = bus_register_input;
                reg3_data = bus_register_input;
            end
            6'b11: begin
                register_data[3] = bus_register_input;
                reg4_data = bus_register_input;
            end
        endcase
    end

end

always @(*) begin
    case (register_addr[5:0])
        6'b00: begin
            selected_register_data = register_data[0];
            reg1_data = selected_register_data;
        end
        6'b01: begin
            selected_register_data = register_data[1];
            reg2_data = selected_register_data;
        end
        6'b10: begin
            selected_register_data = register_data[2];
            reg3_data = selected_register_data;
        end
        6'b11: begin
            selected_register_data = register_data[3];
            reg4_data = selected_register_data;
        end

        default: selected_register_data = 16'b0;
    endcase
end

tri_state_buffer register_tri_state(
    .data_in(selected_register_data),
    .enable(bus_register_out_en),
    .data_out(bus_register_output)
);

endmodule