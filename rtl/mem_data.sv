timeunit 1ns;
timeprecision 1ps;

module mem_data #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic write,
    input logic [WIDTH-1:0] in,
    input logic [WIDTH-1:0] address,
    output logic [WIDTH-1:0] out
);
    logic out_rom, out_ram;

    mux #(.WIDTH(WIDTH)) mux2_1(
        .in1(out_ram),
        .in2(out_rom),
        .sel(address[WIDTH-1]),
        .out(out)
    );

    mem_rom #(.WIDTH(WIDTH)) rom(
        .address(address),
        .out_rom(out_rom)
    );

    mem_ram #(.WIDTH(WIDTH)) ram(
        .clk(clk),
        .rst(rst),
        .write(write),
        .address(address),
        .in(in),
        .out(out_ram)
    );
    
endmodule