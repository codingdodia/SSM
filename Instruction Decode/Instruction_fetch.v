module Instruction_fetch(
    input clock,
    input reset,
    input [3:0] opcode,
    output reg R_W, EN, MFC,
    output reg pc_out_en, pc_increment_en,
    output reg MAR_address_in_en,
    output reg MDR_bus_data_in_en, MDR_bus_data_out_en,
    input DONE,
    input START,
    output IR_in_en,
    output reg [3:0] FSM_start,

);


parameter s0: 4'b0000;
parameter s1: 4'b0001;
parameter s2: 4'b0010;
parameter s3: 4'b0011;
parameter s4: 4'b0100;
parameter s5: 4'b0101;
parameter s6: 4'b0110;
parameter s7: 4'b0111;
parameter s8: 4'b1000;
parameter s9: 4'b1001;
parameter s10: 4'b1010;
parameter s11: 4'b1011;
parameter s12: 4'b1100;
parameter s13: 4'b1101;
parameter s14: 4'b1110;
parameter s15: 4'b1111;



always@(posedge clock) begin
    if(reset) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end

always@(*) begin
    case(current_state)
        s0: begin   
            if(START || DONE) begin
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
        s7: begin
            if(!MFC) begin
                next_state = s8;
            end else begin
                next_state = s7;
            end
        end
        s8: next_state = s9;
        s9: next_state = s10;
        s10: next_state = s11;
        s11: begin
            if(DONE) begin
                next_state = s12;
            end else begin
                next_state = s11;
            end
        end
        s12: next_state = s13;
        s13: next_state = s14;
        s14: next_state = s15;
        s15: next_state = s0;
        default: next_state = s0;
    endcase
end   

always@(posedge clock) begin
    
    if(reset) begin
        pc_out_en = 1'b0;
        pc_increment_en = 1'b0;
        address_in_en = 1'b0;
        MDR_bus_data_in_en = 1'b0;
        MDR_bus_data_out_en = 1'b0;
        FSM_start = 4'b0000;
    end

    else begin
        
        case(current_state)

            s0: begin
                // Do nothing
            end

            s1: begin
                pc_out_en = 1'b1;
            end

            s2: begin
                MAR_address_in_en = 1'b1;
            end

            s3: begin
                EN = 1'b1;
                
            end

            s4: begin
                R_W = 1'b1;
                MAR_address_in_en = 1'b0;
            end
            
            s5: begin
                pc_out_en = 1'b0;
                // Wait for memory to store the data into MDR
            end

            s6: begin
                pc_increment = 1'b1;
                MDR_bus_data_out_en = 1'b1;
            end

            s7:begin
                // Wait for MFC
            end

            s8: begin
                pc_increment = 1'b0;
                IR_in_en = 1'b1;
                
            end

            s9: begin
                

            end

            s10: begin
                IR_in_en = 1'b0;
                // Wait for decode
            end

            s11: begin
                EN = 1'b0;
                MDR_bus_data_out_en = 1'b0;
            end

            s12: begin
                case(opcode)
                    // ALU
                    4'b0001: FSM_start = 4'b0001;  // ADD
                    4'b0010: FSM_start = 4'b0001;  // SUB
                    4'b0011: FSM_start = 4'b0001;  // NOT
                    4'b0100: FSM_start = 4'b0001;  // AND
                    4'b0101: FSM_start = 4'b0001;  // OR
                    4'b0110: FSM_start = 4'b0001;  // XOR
                    4'b0111: FSM_start = 4'b0001;  // XNOR

                    // ALU_Immediate 
                    4'b1000: FSM_start = 4'b0010;  //ADD_I
                    4'b1001: FSM_start = 4'b1010; // SUB_I

                    4'b1010: FSM_start = 4'b0100; // MOV
                    4'b1011: FSM_start = 4'b1000; // MOV_Immediate

                    4'b1100: FSM_start = 4'b1001; // Store
                    4'b1101: FSM_start = 4'b1010; // Jump
                endcase
            end

            s13: begin
                
            end

            s14: begin
                // Wait for done
            end
            
        endcase
    end
end

endmodule