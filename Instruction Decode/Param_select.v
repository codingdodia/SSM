module param_select(
    input [5:0] param;
    output [15:0] reg_data;
)

always@(*) begin
    case(param)
        2'b00: 

