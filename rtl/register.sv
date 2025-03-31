timeunit 1ns;
timeprecision 1ps;

module register #(WIDTH = 8) (
    input logic clk,
    input logic rst,
    input logic signed [WIDTH - 1 :0] in,
    output logic signed [WIDTH - 1 :0] out
);

    always_ff @(posedge clk  or posedge rst) begin
        if(rst)
            out <= '0;
        else
            out <= in;
    end
endmodule