timeunit 1ns;
timeprecision 1ps;

module rssb #(
    parameter int WIDTH = 8
)(
    input  logic clk,
    input logic rst,
    output logic [WIDTH-1:0] oacc,
    output logic [WIDTH-1:0] opc,
    output logic [WIDTH-1:0] oop1,
    output logic [WIDTH-1:0] omem,
    output logic [WIDTH-1:0] osub
);

    //criar os sinais internos e conectar corretamente
    logic [WIDTH-1:0] out_mux_pc;   //f3
    logic [WIDTH-1:0] out_mux_mem;  //f6
    logic [WIDTH-1:0] out_pc;       //f5
    logic [WIDTH-1:0] out_inc1;     //f1
    logic [WIDTH-1:0] out_inc2;     //f0
    logic [WIDTH-1:0] out_mem;      //f2
    logic [WIDTH-1:0] out_op1;      //f4
    logic [WIDTH-1:0] out_acc;      //
    logic [WIDTH-1:0] out_sub;      //f7
    logic neg;
    logic write_pc;
    logic write_op1;
    logic write_acc;
    logic write_mem;
    logic sel_pc;
    logic sel_mem;

    register #(.WIDTH(WIDTH)) pc(
        .clk(clk),
        .rst(rst),
        .write(write_pc),
        .in(out_mux_pc),
        .out(out_pc)
    );

    inc #(.WIDTH(WIDTH)) incr1(
        .in(out_pc),
        .out(out_inc1)
    );

    inc #(.WIDTH(WIDTH)) incr2(
        .in(out_inc1),
        .out(out_inc2)
    );

    mux #(.WIDTH(WIDTH)) mux_pc(
        .in1(out_inc1),
        .in2(out_inc2),
        .sel(sel_pc),
        .out(out_mux_pc)
    );

    register #(.WIDTH(WIDTH)) op1(
        .clk(clk),
        .rst(rst),
        .write(write_op1),
        .in(out_mem),
        .out(out_op1)
    );

    register #(.WIDTH(WIDTH)) acc(
        .clk(clk),
        .rst(rst),
        .write(write_acc),
        .in(out_mem),
        .out(out_acc)
    );

    sub #(.WIDTH(WIDTH)) subtract(
        .in1(out_mem),
        .in2(out_acc),
        .neg(neg),
        .out(out_sub)
    );

    mux #(.WIDTH(WIDTH)) mux_mem(
        .in1(out_pc),
        .in2(out_op1),
        .sel(sel_mem),
        .out(out_mux_mem)
    );

    mem_data #(.WIDTH(WIDTH)) data(
        .clk(clk),
        .rst(rst),
        .write(write_mem),
        .address(out_mux_mem),
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

    assign opc = out_pc;
    assign omem = out_mem;
    assign oop1 = out_op1;
    assign oacc = out_acc;
    assign osub = out_sub;

endmodule: rssb
