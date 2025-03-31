timeunit 1ns;
timeprecision 1ps;

module subneg #(parameter int WIDTH = 8)(
    logic input clk, rst
    );

    //criar os sinais internos e conectar corretamente
    logic [WIDTH-1:0] out_mux;
    logic [WIDTH-1:0] out_pc;
    logic [WIDTH-1:0] out_inc;
    logic [WIDTH-1:0] out_rom;
    logic [WIDTH-1:0] out_data;
    logic [WIDTH-1:0] out_op1;
    logic [WIDTH-1:0] out_op2;
    logic [WIDTH-1:0] out_sub;
    logic neg;
    logic sel_pc;

    register #(WIDTH = 8) pc(
        .clk(clk),
        .rst(rst),
        .in(out_mux),
        .out(out_pc)
    );

    register #(WIDTH = 8) op1(
        .clk(clk),
        .rst(rst),
        .in(out_data),
        .out(out_op1)
    );

    register #(WIDTH = 8) op2(
        .clk(clk),
        .rst(rst),
        .in(out_data),
        .out(out_op2)
    );

    sub #(WIDTH = 8) subtract(
        .in1(out_op1),
        .in2(out_op2),
        .neg(neg),
        .out(out_sub)
    );

    mux #(WIDTH = 8) mux2_1(
        .in1(out_data),
        .in2(out_inc),
        .sel(sel_pc),
        .out(out_mux)
    );

    inc #(WIDTH = 8) incr(
        .in(out_pc),
        .out(out_inc)
    );
    
    mem_rom rom(
        .clk(clk),
        .in(out_pc),
        .out(out_rom)
    );

    mem_data data(
        .clk(clk),
        .in_sub(out_sub),
        .in_rom(out_rom),
        .out(out_data)
    );

    control controle(
        .clk(clk),
        .rst(rst),
        .neg(neg),
        .write_op1(write_op1),
        .write_op2(write_op2),
        .write_mem(write_mem),
        .sel_pc(sel_pc),
        .write_pc(write_pc)
    );
    
endmodule: subneg
