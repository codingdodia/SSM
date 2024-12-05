module MOV_FSM(
    input clock,
    input reset,
    input FSM_start,
    input [5:0] source,
    input [5:0] dest,
    output reg [5:0] register_addr,
    output reg bus_register_input_en,
    output reg bus_register_out_en,
    output reg I0_bus_input_en,
    output reg I0_bus_output_en,
    output reg I1_bus_output_en,
    output reg [15:0] FSM_MOV_immediate_bus_output;
    output reg done
);

reg [3:0] current_state, next_state;
reg p1isReg, p1isI0, p1isI1, p2isReg, p2isI0;
reg immediate_en;
reg immediate_extended;

parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;
parameter s6 = 4'b0110;

always @(posedge clock) begin
    if (reset) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end



always@(*) begin

    if(source < 6'b000101) begin
        p1isReg = 1;
        p1isI0 = 0;
        p1isI1 = 0;
    end else if(source < 6'b000110) begin
        p1isReg = 0;
        p1isI0 = 1;
        p1isI1 = 0;
    end else begin
        p1isReg = 0;
        p1isI0 = 0;
        p1isI1 = 1;
    end

    if(dest < 6'b000101) begin
        p2isReg = 1;
        p2isI0 = 0;
    end else begin
        p2isReg = 0;
        p2isI0 = 1;
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
        s6: next_state = s0;
        default: next_state = s0;
    endcase
end

always@(posedge clock) begin

    if (reset) begin
        done <= 1'b0;
        bus_register_input_en = 1'b0;
        bus_register_out_en = 1'b0;
        I0_bus_input_en = 1'b0;
        I0_bus_output_en = 1'b0;
        I1_bus_output_en = 1'b0;
    end 
    
    else begin
        case(current_state)
            s0: begin 
                done = 1'b0;  
            end

            s1: begin
               immediate_extended = {10'b0, source};
            end

            s2: begin
                immediate_en = 1'b1;
            end


            s2: begin
                if(p2isReg) begin
                    register_addr = dest;
                    bus_register_input_en = 1'b1;
                end else if(p2isI0) begin
                    I0_bus_input_en = 1'b1;
                end
            end

            s3: begin
                bus_register_input_en = 0;
                I0_bus_input_en = 0;
            end

            s4: begin
               immediate_en = 1'b0;
            end

            s5: begin

                done = 1'b1;
            end


            s6: begin
                done = 1'b0;
            end

            default: next_state = s0;

        endcase
    end
end

tri_state_buffer MOV_immediate_tri_state(
    .data_in(immediate_extended),
    .enable(immediate_en),
    .data_out(FSM_MOV_immediate_bus_output)
);

endmodule

