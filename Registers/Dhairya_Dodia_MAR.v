module MAR(
    input MAR_clock,
    input MAR_reset,
    input address_in_en,
    input [15:0] MAR_address_in,
    output reg [15:0] MAR_address_out,
    output reg [15:0] MAR_data
);


always @(posedge MAR_clock) begin
    if (MAR_reset) begin
        MAR_address_out = 16'b0;
    end

    else if(address_in_en) begin
        MAR_data = MAR_address_in;
    end
end

always@(*) begin
    MAR_address_out = MAR_data;
end

endmodule