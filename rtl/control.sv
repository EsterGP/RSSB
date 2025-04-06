timeunit 1ns;
timeprecision 1ps;

module control(
    input logic clk,
    input logic rst,
    input logic neg,
    output logic sel_pc,
    output logic sel_mem,
    output logic write_op1,
    output logic write_acc,
    output logic write_mem,
    output logic write_pc
);

    typedef enum logic {
        E0, E1
    } stateType;
    stateType state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if(rst)
            state <= E0;
        else
            state <= next_state;
    end

    always_comb begin
        sel_pc    = 0;
        sel_mem   = 0;
        write_op1 = 0;
        write_acc = 0;
        write_mem = 0;
        write_pc  = 0;
        next_state = state;

        case(state)
            E0: begin
                sel_pc    = neg;
                sel_mem   = 1;
                write_op1 = 1;
                write_acc = 0;
                write_mem = 0;
                write_pc  = 0;
                next_state = E1;
            end

            E1: begin
                sel_pc    = neg;
                sel_mem   = 0;
                write_op1 = 0;
                write_acc = 1;
                write_mem = 1;
                write_pc  = 1;
                next_state = E0;
            end
            default: next_state = E0;
        endcase

    end
/*
    typedef enum logic [1:0] {
        E0, E1, E2, E3
    } stateType;
    stateType state, next_state;

    always_comb begin
        sel_pc    = 0;
        sel_mem   = 0;
        write_op1 = 0;
        write_acc = 0;
        write_mem = 0;
        write_pc  = 0;
        next_state = state;
        
        case(state)
            E0: begin
                sel_pc    = 1;
                sel_mem   = 0;
                write_op1 = 1;
                write_acc = 0;
                write_mem = 0;
                write_pc  = 1;
                next_state = E1;
            end
    
            E1:	begin
                sel_pc    = 1;
                sel_mem   = 0;
                write_op1 = 0;
                write_acc = 1;
                write_mem = 0;
                write_pc  = 1;
                next_state = E2;
            end
    
            E2: begin
                sel_pc    = 1;
                write_op1 = 0;
                write_acc = 0;
                write_mem = 1;
                write_pc  = 1;
                next_state = E3;
            end
    
            E3:	begin
                write_op1 = 0;
                write_acc = 0;
                write_mem = 0;
                sel_pc    = neg;
                write_pc  = 1;
                next_state = E0;
            end
    
            default: next_state = E0;
        endcase
    end
*/
endmodule