timeunit 1ns;
timeprecision 1ps;

module tb_sub;
    parameter int WIDTH = 8;

    logic clk;
    logic signed [WIDTH-1:0] in1;
    logic signed [WIDTH-1:0] in2;
    logic signed [WIDTH-1:0] out;
    logic neg;

    sub #(.WIDTH(WIDTH)) dut (
        .in1(in1),
        .in2(in2),
        .out(out),
        .neg(neg)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        for (int i = 0; i < 100; i++) begin

            in1 = $urandom;  
            in2 = $urandom; 

            $display("in1 = %d, in2 = %d: Expected Output = %d, Output = %d",
                        in1, in2, in2-in1, out);

            #20;

        end

        #40;
        $stop();
    end
endmodule