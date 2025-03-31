timeunit 1ns;
timeprecision 1ps;

module tb_reg;

    parameter int WIDTH = 8;

    logic clk;
    logic rst;
    logic [WIDTH-1:0] in;
    logic [WIDTH-1:0] out;

    // Instancia o DUT (Device Under Test)
    register #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .reset(rst),
        .in(in),
        .out(out)
    );

    // Gera clock
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk reset in      out");
        $display("------------------------------------");

        // Inicialização
        clock = 0;
        reset = 0;
        in = '0;

        // Aplica reset
        reset = 1;
        #10;
        $display("%0t\t%b   %b   0x%0h   0x%0h", $time, clk, rst, in, out);

        reset = 0;

        // Escreve valor 0xAA
        in = 8'hAA;
        #10;
        $display("%0t\t%b   %b   0x%0h   0x%0h", $time, clk, rst, in, out);

        // Escreve valor 0x55
        in = 8'h55;
        #10;
        $display("%0t\t%b   %b   0x%0h   0x%0h", $time, clk, rst, in, out);

        // Não muda entrada, observa se mantém valor
        in = 8'h55;
        #10;
        $display("%0t\t%b   %b   0x%0h   0x%0h", $time, clk, rst, in, out);

        // Aplica novo reset
        reset = 1;
        #10;
        $display("%0t\t%b   %b   0x%0h   0x%0h", $time, clk, rst, in, out);

        $stop;
    end

endmodule