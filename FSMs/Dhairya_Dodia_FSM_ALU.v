module ALU_FSM(
    input clock,
    input reset,
    input [3:0] FSM_start,
    input [3:0] opcode,
    input [5:0] param1,
    input [5:0] param2,
    output reg bus_register_input_en,
    output reg bus_register_out_en,
    output reg [5:0] register_addr,
    output reg latched_bus1_en,
    output reg latched_bus2_en,
    output reg alu_bus_out_en,
    output reg [3:0] alu_control,
    output reg I0_bus_input_en,
    output reg I0_bus_output_en,
    output reg I1_bus_output_en,
    output reg done
);

reg [3:0] current_state, next_state;

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
parameter s11 = 4'b1011;
parameter s12 = 4'b1100;
parameter s13 = 4'b1101;

always @(posedge clock) begin
    if (reset) begin
        current_state = s0;
        latched_bus1_en = 1'bz;
        latched_bus2_en = 1'bz;
        bus_register_out_en = 1'bz;
        bus_register_input_en = 1'bz;
        I0_bus_input_en = 1'bz;
        I0_bus_output_en = 1'bz;
        I1_bus_output_en = 1'bz;
        alu_bus_out_en = 1'bz;
        alu_control = 4'b0000;
        done = 1'b0;
    end else begin
        current_state = next_state;
    end
end

always@(*) begin
    case(current_state)
        s0: begin   
            if(FSM_start === 4'b0001) begin
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
        s10: next_state = s11;
        s11: next_state = s12;
        s12: next_state = s13;
        s13: next_state = s0;
        default: next_state = s0;
    endcase
end

always@(posedge clock) begin

    case(current_state)
        s0: begin 
            done = 1'b0;  
        end

        s1: begin
            if (param1 > 6'b001111) begin
                I0_bus_output_en = 1'b0;
            end else begin
                // Load param1 into register
                register_addr = param1;
                bus_register_out_en = 1'b1;
            end
        end

        s2: begin
            latched_bus1_en = 1'b1;
            alu_control = opcode;
        end

        s3: begin
            latched_bus1_en = 1'b0;
        end

        s4: begin
            bus_register_out_en = 1'b0;
            I0_bus_output_en = 1'b0;
        end

        s5: begin
            if (param2 > 4'b0011) begin
                I0_bus_output_en = 1'b0;
            end else begin
                // Load param2 into register
                register_addr = param2;
                bus_register_out_en = 1'b1;
            end
        end

        s6: begin
            latched_bus2_en = 1'b1;
        end

        s7: begin
            latched_bus2_en = 1'b0;
        end

        s8: begin
            bus_register_out_en = 1'b0;
            I0_bus_output_en = 1'b0;
        end

        s9: begin
            alu_bus_out_en = 1'b1;
            register_addr = param1;
        end

        s10: begin
            bus_register_input_en = 1'b1;
        end

        s11: begin 
            bus_register_input_en = 1'b0;
        end

        s12: begin
            alu_bus_out_en = 1'b0;
            done = 1'b1;
        end

        s13: begin
            done = 1'b0;
        end

        default: next_state = s0;

    endcase
end

endmodule