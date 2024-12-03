module tri_state_buffer (
    input [15:0] data_in,
    input enable,
    output [15:0] data_out
);

    assign data_out = enable ? data_in : 16'bz;

endmodule