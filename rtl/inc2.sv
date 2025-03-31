timeunit 1ns;
timeprecision 1ps;

module inc2 #(
    parameter int WIDTH = 8
) (
    input logic signed [WIDTH-1:0] in,
    output logic signed [WIDTH-1:0]out
);

    assign out = in + 2;
    
endmodule