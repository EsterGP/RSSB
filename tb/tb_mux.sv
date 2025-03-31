timeunit 1ns;
timeprecision 1ps;

module tb_mux;

    parameter int WIDTH = 8;

    logic [WIDTH-1:0] in1;
    logic [WIDTH-1:0] in2;
    logic sel;
    logic clk;
    logic [WIDTH-1:0] out;

    mux #(.WIDTH(WIDTH)) dut (
        .in1(in1),
        .in2(in2),
        .sel(sel),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        for (int i = 0; i < 100; i++) begin

            in1 = $urandom;  
            in2 = $urandom; 
            sel = $urandom_range(0,1); 

            #20;

        end

        #40;
        $stop();
    end
    
endmodule: tb_mux

