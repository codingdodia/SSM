module ALU(
    input reg latched_bus1_en,
    input reg latched_bus2_en,
    input [15:0] bus_in,
    input reg [3:0] control,
    input reset,
    input reg bus_out_en,
    output [15:0] bus_out

);

reg [15:0] latched_bus1_in;
reg [15:0] latched_bus2_in;
reg [15:0] alu_result;




always@(*)
begin 


    if(reset) begin
        latched_bus1_in = 16'b0;
        latched_bus2_in = 16'b0;
    end

    if (latched_bus1_en) begin
            latched_bus1_in = bus_in;
        end 
    else if (latched_bus2_en) begin
            latched_bus2_in = bus_in;
    end 
    

    case(control)
        4'b0001: alu_result = latched_bus1_in + latched_bus2_in; //ADD
        4'b0010: alu_result = latched_bus1_in - latched_bus2_in; //SUB
        4'b0011: alu_result = ~latched_bus1_in; //NOT
        4'b0100: alu_result = latched_bus1_in & latched_bus2_in; // AND
        4'b0101: alu_result = latched_bus1_in | latched_bus2_in; // OR
        4'b0110: alu_result = latched_bus1_in ^ latched_bus2_in; // XOR
        4'b0111: alu_result = ~(latched_bus1_in ^ latched_bus2_in); // XNOR
        default alu_result = 16'b0;
    endcase
      
end

tri_state_buffer tri_state[15:0] (
    .data_in(alu_result),
    .enable(bus_out_en),
    .data_out(bus_out)
);

endmodule