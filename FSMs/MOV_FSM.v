module MOV_FSM(
    input clock,
    input reset,
    input [3:0] start;
    input [5:0] source;
    input [5:0] dest;
    output [5:0] register_addr;
    output reg bus_register_input_en;
    output reg bus_register_out_en;
    output reg I0_bus_input_en,
    output reg I0_bus_output_en,
    output reg I1_bus_ouput_en,
    output reg done
);

reg [3:0] current_state, next_state;
reg p1isReg, p1isI0, p1isI1, p2isReg, p2isI0, p2isI1;

parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;

always @(posedge clock) begin
    if (reset) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end



always@(*) begin

    if(param1 < 5) begin
        p1isReg = 1;
        p1isI0 = 0;
        p1isI1 = 0;
    end else if(param1 < 6) begin
        p1isReg = 0;
        p1isI0 = 1;
        p1isI1 = 0;
    end else
        p1isReg = 0;
        p1isI0 = 0;
        p1isI1 = 2;
    end

    if(param2 < 5) begin
        p2isReg = 1;
        p2isI0 = 0;
        p2isI1 = 0;
    end else if(param2 < 6) begin
        p2isReg = 0;
        p2isI0 = 1;
        p2isI1 = 0;
    end else
        p2isReg = 0;
        p2isI0 = 0;
        p2isI1 = 2;
    end


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
        default: next_state = s0;
    endcase
end

always@(posedge clock) begin

    if (reset) begin
        done <= 1'b0;
        bus_register_input_en <= 1'b0;
        bus_register_out_en <= 1'b0;
        latched_bus1_en <= 1'b0;
        latched_bus2_en <= 1'b0;
        alu_bus_out_en <= 1'b0;
    end 
    
    else begin
        case(current_state)
            s0: begin 
                done = 1'b0;  
            end

            s1: begin
                if(p1isReg) begin
                    register_addr = source;
                    bus_register_out_en = 1;
                end else if(p1isI0) begin
                    I0_bus_output_en = 1;
                end else
                    I1_bus_output_en = 1;
                end
            end

            s2: begin
                if(p2isReg) begin
                    register_addr = dest;
                    bus_register_input_en = 1;
                end else if(p2isI0) begin
                    I0_bus_input_en = 1;
                end
            end

            s3: begin
                if(p1isReg) begin
                    register_addr = source;
                    bus_register_out_en = 0;
                end else
                    I0_bus_output_en = 0;
                    I1_bus_output_en = 0;
                end
            end

            s4: begin

                done = 1;
            end


            s5: begin
                done = 0;
            end

            default: next_state = s0;

        endcase
    end
end

endmodule

