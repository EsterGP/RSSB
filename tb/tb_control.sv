timeunit 1ns;
timeprecision 1ps;

module tb_control;
    logic clk;
    logic rst;
    logic neg;
    logic write_op1;
    logic write_op2;
    logic write_mem;
    logic sel_pc;
    logic write_pc;

    control dut (
        .clk(clk),
        .rst(rst),
        .neg(neg),
        .write_op1(write_op1),
        .write_op2(write_op2),
        .write_mem(write_mem),
        .sel_pc(sel_pc),
        .write_pc(write_pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        neg = 0;
        rst = 1;
        #20 rst = 0;

        for (int i = 0; i < 100; i++) begin
            $display("Iteração: %d clk = %d, rst = %d, neg = %d",
                        i, clk, rst, neg);
            $display("\nwrite_op1: %d write_op2 = %d, write_mem = %d, sel_pc = %d, write_pc = %d",
                        write_op1, write_op2, write_mem, sel_pc, write_pc);

            #20;

        end

        #40;
        $stop();
    end
endmodule