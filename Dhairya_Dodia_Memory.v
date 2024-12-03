module Memory(
    dataout,
    MFC,
    EN,
    addr,
    datain,
    RW
);

input EN, RW;
input [15:0] addr, datain;
output [15:0] dataout,
output MFC;

reg [15:0] dataout, memorycell;
reg MFC;

always@(posedge RN)
begin
    if(RW == 1) begin
        case(addr)
            16'b0: dataout = 16'b1011001001000001;
            16'b0000000000000001: Dataout = 16'b0110000001111110;
            16'b0000000000000010: Dataout = 16'b0001000001000011;
            16'b0000000000000011: Dataout = 16'b0101000001000111;
            16'b0000000000000100: Dataout = 16'b1001000001000011;
            16'b0000000000000101: Dataout = 16'b0110000001111111;
            16'b0000000000000110: Dataout = 16'b1101000011000001;
            16'b0000000000000111: Dataout = 16'b1100000001000010;
            default: Dataout = memorycell;
        endcase

    end

    else memorycell = datain;
        #5 MFC = 1;
end

always@(negedge EN)
    MFC = 0;


endmodule;