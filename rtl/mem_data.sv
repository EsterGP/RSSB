timeunit 1ns;
timeprecision 1ps;

module mem_data #(
    parameter WIDTH = 8;
) (
    input logic clk,
    input logic [WIDTH-1:0] in_sub,
    input logic [WIDTH-1:0] in_rom,
    output logic [WIDTH-1:0] out
);

    register #(WIDTH = 8) reg_data(
        .clk(clk),
        .rst(rst),
        .in(),
        .out()
    );

    mux #(WIDTH = 8) mux2_1(
        .in1(out_data),
        .in2(out_inc),
        .sel(sel_pc),
        .out(out_mux)
    );

    mem_rom rom(
        .clk(clk),
        .in_pc(out_pc),
        .out_rom(out_rom)
    );
    
endmodule