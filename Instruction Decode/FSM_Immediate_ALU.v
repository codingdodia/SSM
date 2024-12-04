module ALU_Immediate(
    input clock,
    input reset,
    input FSM_start,
    input [3:0] opcode,
    input [5:0] param1,
    input [15:0] immediate,
    output [15:0] FSM_bus_output,
    output reg bus_register_input_en,
    output reg bus_register_out_en,
    output reg [5:0] register_addr,
    output reg latched_bus1_en,
    output reg latched_bus2_en,
    output reg alu_bus_out_en,
    output reg [3:0] alu_control,
    output reg done
);

reg immediate_en, current_state, next_state;

parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;
parameter s6 = 4'b0110;
parameter s7 = 4'b0111;
parameter s8 = 4'b1000;
parameter s9 = 4'b1001;
parameter s10 = 4'b1010;

always @(posedge clock) begin
    if (reset) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end

always@(*) begin
    case(current_state)
        s0: begin   
            if(FSM_start) begin
                next_state = s1;
            end else begin
                next_state = s0;
            end
        end
        s1: next_state = s2;
        s2: next_state = s3;
        s3: next_state = s4;
        s4: next_state = s5;
        s5: next_state = s6;
        s6: next_state = s7;
        s7: next_state = s8;
        s8: next_state = s9;
        s9: next_state = s10;
        s10: next_state = s0;
        default: next_state = s0;
    endcase
end

tri_state_buffer immediate_tri_state(
    .data_in(immediate),
    .enable(immediate_en),
    .data_out(FSM_bus_output)
);

always@(posedge clock) begin

    if (reset) begin
        done <= 1'b0;
        bus_register_input_en <= 1'b0;
        bus_register_out_en <= 1'b0;
        latched_bus1_en <= 1'b0;
        latched_bus2_en <= 1'b0;
        alu_bus_out_en <= 1'b0;
        immediate_en <= 1'b0;
    end 
    
    else begin
        case(current_state)
            s0: begin 
                done = 1'b0;
                
            end

            s1: begin
                register_addr = param1;
                bus_register_out_en = 1;
            end

            s2: begin
                latched_bus1_en = 1;
                alu_control = opcode;
            end

            s3: begin
                latched_bus1_en = 0;
                bus_register_out_en = 0;
            end

            s4: begin
                immediate_en = 1;
            end

            s5: begin
                latched_bus2_en = 1;
            end

            s6: begin
                latched_bus2_en = 0;
                bus_register_out_en = 0;
            end

            s7: begin
                alu_bus_out_en = 1;
                register_addr = param1;
            end

            s8: begin
                bus_register_input_en = 1;
            end

            s9: begin 
                bus_register_input_en = 0;
                alu_bus_out_en = 0;
                done = 1;
            end

            s10: begin
                done = 0;
            end

            default: next_state = s0;

        endcase
    end
end

endmodule