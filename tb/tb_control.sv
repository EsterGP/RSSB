timeunit 1ns;
timeprecision 1ps;

module tb_control;
    logic clk;
    logic rst;
    logic neg;
    logic sel_pc;
    logic sel_mem;
    logic write_op1;
    logic write_acc;
    logic write_mem;
    logic write_pc;

    integer i;

    control dut (
        .clk(clk),
        .rst(rst),
        .neg(neg),
        .write_op1(write_op1),
        .write_acc(write_acc),
        .write_mem(write_mem),
        .sel_pc(sel_pc),
        .sel_mem(sel_mem),
        .write_pc(write_pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        neg = 0;
        rst = 1;
        #20 rst = 0;

        for (i = 0; i < 10; i++) begin
            $display("Iteração: %d clk = %d, rst = %d, neg = %d",
                        i, clk, rst, neg);
            $display("\nsel_pc = %d, sel_mem = %d, write_op1: %d write_acc = %d, write_mem = %d, write_pc = %d",
                        sel_pc, sel_mem, write_op1, write_acc, write_mem, write_pc);

            #20;

        end

        neg = 1;
        $display("Iteração: %d clk = %d, rst = %d, neg = %d",
                    i, clk, rst, neg);
        $display("\nsel_pc = %d, sel_mem = %d, write_op1: %d write_acc = %d, write_mem = %d, write_pc = %d",
                    sel_pc, sel_mem, write_op1, write_acc, write_mem, write_pc);

        #20;

        for (i = 10; i < 20; i++) begin
            neg = ~neg;
            $display("Iteração: %d clk = %d, rst = %d, neg = %d",
                        i, clk, rst, neg);
            $display("\nsel_pc = %d, sel_mem = %d, write_op1: %d write_acc = %d, write_mem = %d, write_pc = %d",
                        sel_pc, sel_mem, write_op1, write_acc, write_mem, write_pc);

            #20;

        end

        #40;
        $stop();
    end
endmodule