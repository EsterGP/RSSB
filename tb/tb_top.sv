timeunit 1ns;
timeprecision 1ps;

module tb_top;

    localparam WIDTH = 8;

    logic clk;
    logic rst;
    logic [WIDTH-1:0] oacc;
    logic [WIDTH-1:0] omem;
    logic [WIDTH-1:0] oop1;
    logic [WIDTH-1:0] opc;
    logic [WIDTH-1:0] osub;

    integer i;

    rssb #(
        .WIDTH(WIDTH)
    ) dut(
        .clk(clk),
        .rst(rst),
        .oacc(oacc),
        .omem(omem),
        .oop1(oop1),
        .opc(opc),
        .osub(osub)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0;

        for (i = 0; i < 10; i++) begin
            $display("Iteração: %d clk = %d, rst = %d",
                        i, clk, rst);
            $display("\nout_pc = %d, out_mem = %d, out_op1: %d out_sub = %d, out_acc = %d",
                        opc, omem, oop1, osub, oacc);

            #20;

        end

        #40;
        $stop();
    end
endmodule