timeunit 1ns;
timeprecision 1ps;

module rssb #(parameter int WIDTH = 8)(
    logic input clk, rst
    );

    //criar os sinais internos e conectar corretamente
    logic [WIDTH-1:0] out_mux_pc;   //f3
    logic [WIDTH-1:0] out_mux_mem;  //f6
    logic [WIDTH-1:0] out_pc;       //f5
    logic [WIDTH-1:0] out_inc1;     //f1
    logic [WIDTH-1:0] out_inc2;     //f0
    logic [WIDTH-1:0] out_mem;      //f2
    logic [WIDTH-1:0] out_op1;      //f4
    logic [WIDTH-1:0] out_sub;      //f7
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

    inc #(WIDTH = 8) incr1(
        .in(out_pc),
        .out(out_inc1)
    );

    inc #(WIDTH = 8) incr2(
        .in(out_inc1),
        .out(out_inc2)
    );

    mux #(WIDTH = 8) mux_pc(
        .in1(out_inc1),
        .in2(out_inc2),
        .sel(sel_pc),
        .out(out_mux_pc)
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
        .in1(out_mem),
        .in2(out_acc),
        .neg(neg),
        .out(out_sub)
    );

    mux #(WIDTH = 8) mux_mem(
        .in1(out_pc),
        .in2(out_op1),
        .sel(sel_mem),
        .out(out_mux_mem)
    );

    mem_data data(
        .clk(clk),
        .rst(rst),
        .write(write_mem),
        .address(out_mux),
        .in(out_sub),
        .out(out_mem)
    );

    control controle(
        .clk(clk),
        .rst(rst),
        .neg(neg),
        .sel_pc(sel_pc),
        .sel_mem(sel_mem),
        .write_op1(write_op1),
        .write_acc(write_acc),
        .write_mem(write_mem),
        .write_pc(write_pc)
    );
    
endmodule: subneg
