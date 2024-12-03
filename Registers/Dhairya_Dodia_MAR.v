module MAR(
    input MAR_clock,
    input MAR_reset,
    input [15:0] MAR_address_in,
    output reg [15:0] MAR_address_out
);

always @(posedge MAR_clock) begin
    if (MAR_reset) begin
        address_out <= 16'b0;
    end

    else begin
        address_out <= address_in;
    end
end

endmodule