timeunit 1ns;
timeprecision 1ps;

module mem_rom #(
    parameter WIDTH = 8;
) (
    input logic clk,
    input logic [WIDTH-1:0] in,
    output logic [WIDTH-1:0] out
);
    logic [WIDTH-1:0] addr_rom [0:(1<<WIDTH)-1];
    //logic [WIDTH-1:0] addr_rom [WIDTH-1:0];

    case (addr_rom)
        0: out = addr_data[3];
        1: out = addr_data[1];
        2: out = addr_data[127];
        3: addr_rom = 4;
        4: out = addr_data[127];
        5: out = addr_data[1];
        6: out = addr_data[127];
        7: addr_rom = 4
        8: out = addr_data[1];
        9: out = addr_data[0];
        10:out = addr_data[127];
        11:addr_rom = 0
        default: addr_rom = 0;
    endcase

    assign addr_rom[0] = addr_data[3];
    assign addr_rom[1] = addr_data[1];
    assign addr_rom[2] = addr_data[127];
    assign addr_rom[3] = addr_rom[4];

    assign addr_rom[4] = addr_data[127];
    assign addr_rom[5] = addr_data[1];
    assign addr_rom[6] = addr_data[127];
    assign addr_rom[7] = addr_rom[4];

    assign addr_rom[8] = addr_data[1];
    assign addr_rom[9] = addr_data[0];
    assign addr_rom[10] = addr_data[127];
    assign addr_rom[11] = addr_rom[0];
    
endmodule