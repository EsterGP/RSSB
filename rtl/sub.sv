timeunit 1ns;
timeprecision 1ps;

module sub #(
    parameter int WIDTH=8
) (
    input  logic signed [WIDTH-1:0] in1,
    input  logic signed [WIDTH-1:0] in2,
    output logic neg,
    output logic signed [WIDTH-1:0] out
);
    logic [WIDTH-1:0] temp;

    assign temp = in1-in2;
    assign out  = temp;

    //assign temp = (out<0) ? 1 : 0;
    assign neg = temp[WIDTH-1];

endmodule