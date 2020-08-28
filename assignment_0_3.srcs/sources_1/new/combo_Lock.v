`timescale 1ns / 1ps

module combo_Lock
(
    input CLK, RESET,
    input b0, b1,
    output reg UNLOCK
    
);
    localparam s0 = 3'b000, s1 = 3'b001, 
                s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
    
    reg [2 : 0] current_state, next_state;
    
    initial
    begin
        current_state = s0;
        UNLOCK = 0;
    end
    
    
    // State Registers
    always @ (posedge CLK)
    begin
        if(RESET) current_state <= s0;
        else current_state <= next_state;
    end
    
    // Next State Logic
    always @ (current_state or b0 or b1)
    begin
        case(current_state)
            s0: if(b0)
                    next_state = s1;
                else
                    next_state = s0;
            s1: if(b1)
                    next_state = s2;
                else
                    next_state = s1;
            s2: if(b0)
                    next_state = s3;
                else
                    next_state = s0;
            s3: if(b0)
                    next_state = s4;
                else
                    next_state = s0;
            s4: if(b1)
                    next_state = s0;
                else
                    next_state = s1;
            default next_state = s0;
        endcase
    end
    
    // Output Logic
    always @ (current_state or b0 or b1)
    begin
        if( (current_state == s4) & b1 == 1)
            UNLOCK = 1;
        else 
            UNLOCK = 0;
    end
endmodule





