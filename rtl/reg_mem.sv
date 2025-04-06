timeunit 1ns;
timeprecision 1ps;

module reg_mem #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic write,
	input logic [WIDTH-1:0] init, 
    input logic [WIDTH-1:0] in,
    output logic signed [WIDTH-1:0] out
    );

    always_ff @(posedge clk or posedge rst) begin
        if(rst)
            out <= init;
        else if(write)
            out <= in;
    end
endmodule