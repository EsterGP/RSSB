timeunit 1ns;
timeprecision 1ps;

module tb_inc;
    parameter int WIDTH = 8;

    logic clk;
    logic signed [WIDTH-1:0] in;
    logic signed [WIDTH-1:0] out;

    inc #(.WIDTH(WIDTH)) dut (
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        for (int i = 0; i < 100; i++) begin

            in = $urandom;  

            $display("in = %d: Expected Output = %d", in, in+1);

            #20;

        end

        #40;
        $stop();
    end
endmodule