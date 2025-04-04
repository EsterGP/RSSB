timeunit 1ns;
timeprecision 1ps;

module rssb #(parameter int WIDTH = 8)(
    logic input clk, rst
    );

    //criar os sinais internos e conectar corretamente
    logic [WIDTH-1:0] out_mux;
    logic [WIDTH-1:0] out_pc;
    logic [WIDTH-1:0] out_inc1;
//    logic [WIDTH-1:0] out_inc2;
//    logic [WIDTH-1:0] out_rom;
    logic [WIDTH-1:0] out_data;
    logic [WIDTH-1:0] out_op1;
    logic [WIDTH-1:0] out_op2;
    logic [WIDTH-1:0] out_sub;
    logic neg;
    logic write_pc;
    logic write_op1;
    logic write_acc;
    logic write_mem;
    logic sel_pc;
    logic sel_mem;

    register #(WIDTH = 8) pc(
        .clk(clk),
        .rst(rst),
        .write(write_pc),
        .in(out_mux),
        .out(out_pc)
    );

    inc1 #(WIDTH = 8) incr1(
        .in(out_pc),
        .out(out_inc1)
    );
/*
    inc2 #(WIDTH = 8) incr2(
        .in(out_pc),
        .out(out_inc2)
    );
*/
    mux #(WIDTH = 8) mux_pc(
        .in1(out_inc1),
        .in2(out_inc2),
        .sel(sel_pc),
        .out(out_mux)
    );

    register #(WIDTH = 8) op1(
        .clk(clk),
        .rst(rst),
        .write(write_op1),
        .in(out_data),
        .out(out_op1)
    );

    register #(WIDTH = 8) acc(
        .clk(clk),
        .rst(rst),
        .write(write_acc),
        .in(out_data),
        .out(out_acc)
    );

    sub #(WIDTH = 8) subtract(
        .in1(out_op1),
        .in2(out_acc),
        .neg(neg),
        .out(out_sub)
    );

    mux #(WIDTH = 8) mux_mem(
        .in1(out_op1),
        .in2(out_inc2),
        .sel(sel_mem),
        .out(out_mux)
    );
/*   
    mem_rom rom(
        .clk(clk),
        .in(out_pc),
        .out(out_rom)
    );
*/
    mem_data data(
        .clk(clk),
        .rst(rst),
        .write(write_mem),
        .address(address),
        .in_sub(out_sub),
        .in_rom(out_rom),
        .out(out_data)
    );

    control controle(
        .clk(clk),
        .rst(rst),
        .neg(neg),
        .write_op1(write_op1),
        .write_acc(write_acc),
        .write_mem(write_mem),
        .sel_pc(sel_pc),
        .write_pc(write_pc)
    );
    
endmodule: subneg
