timeunit 1ns;
timeprecision 1ps;

module mem_rom #(
    parameter WIDTH = 8
) (
    input logic [WIDTH-1:0] address,
    output logic [WIDTH-1:0] out_rom
);

    assign out_rom =
                (address == 8'b00000000)  ?   8'b00000000: //temp=0
                (address == 8'b00000001)  ?   8'b00000000: //temp=0
                (address == 8'b00000010)  ?   8'b00000000: //temp=0
                (address == 8'b00000011)  ?   8'b00000001: //x=1
				 
                (address == 8'b00000100)  ?   8'b00000001: //x=1
                (address == 8'b00000101)  ?   8'b00000010: //y=2
                (address == 8'b00000110)  ?   8'b00000000: //temp=0
                (address == 8'b00000111)  ?   8'b00000000: //temp=0
					 
                (address == 8'b00001000)  ?   8'b00000001: //x=1
                (address == 8'b00001001)  ?   8'b00000000: //temp=0
                (address == 8'b00001010)  ?   8'b00000000: //temp=0
                (address == 8'b00001011)  ?   8'b00000000: //temp=0

                (address == 8'b00001100)  ?   8'b00000011: //z=3
                (address == 8'b00001101)  ?   8'b00000001: //x=1
                                     	      8'b00000000;
    
endmodule