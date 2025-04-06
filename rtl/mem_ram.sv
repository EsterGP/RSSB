timeunit 1ns;
timeprecision 1ps;

module mem_ram #(
    parameter WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic write,
    input logic [WIDTH-1:0] address,
    input logic [WIDTH-1:0] in,
    output logic [WIDTH-1:0] out
);
    wire [WIDTH-1:0] q00, q01, q10, q11, t0, t1;
	wire e00, e01, e10, e11;
	wire [1:0] naddress;

	not(naddress[1], address[1]);
	not(naddress[0], address[0]);
	and(e00, address[7], naddress[1], naddress[0], write);
	and(e01, address[7], naddress[1],  address[0], write);
	and(e10, address[7],  address[1], naddress[0], write);
	and(e11, address[7],  address[1],  address[0], write);

	reg_mem r00(.in(in), .out(q00), .clk(clk), .rst(rst), .write(e00), .init(8'b00000001));
	reg_mem r01(.in(in), .out(q01), .clk(clk), .rst(rst), .write(e01), .init(8'b00000010));
	reg_mem r10(.in(in), .out(q10), .clk(clk), .rst(rst), .write(e10), .init(8'b00001000));
	reg_mem r11(.in(in), .out(q11), .clk(clk), .rst(rst), .write(e11), .init(8'b00000100));
	mux #(.WIDTH(WIDTH)) mout(.in2(t0), .in1(t1), .sel(address[1]), .out(out));
	mux #(.WIDTH(WIDTH)) mt1(.in2(q10), .in1(q11), .sel(address[0]), .out(t1));
	mux #(.WIDTH(WIDTH)) mt0(.in2(q00), .in1(q01), .sel(address[0]), .out(t0));

endmodule