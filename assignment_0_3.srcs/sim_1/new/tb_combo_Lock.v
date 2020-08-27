`timescale 1ns / 1ps

module tb_combo_Lock;

//Inputs
reg CLK, RESET, b0, b1;
//Outputs
wire UNLOCK;
//Instantiate DUT
combo_Lock DUT(.CLK(CLK), .RESET(RESET), .b0(b0), .b1(b1), .UNLOCK(UNLOCK) );
// Clock generation
initial CLK <= 0;
always #25 CLK <= ~CLK;
// Initial settings
initial
begin
    RESET = 0;
    b0 = 0; 
    b1 = 0;
end

initial
begin
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 0;
        b1 = 1;
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 0;
        b1 = 1;
    @(posedge CLK);
        b0 = 1;
        b1 = 0;
    @(posedge CLK);
        b0 = 0;
        b1 = 1;
    @(posedge CLK);
        b0 = 0;
        b1 = 1;
end
endmodule

