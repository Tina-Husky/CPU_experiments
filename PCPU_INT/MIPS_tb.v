module MIPS_tb(
  );
  `timescale 1ns/1ps
  reg clk, rst, INT;
  MIPS mips(clk, rst,INT);
  initial begin
    //$monitor($time, "PC = %8x, IR = %8x, state = %d, ALUOut = 0x%x", mips.my_PC.PC, mips.my_IR.IR, mips.my_Ctrl.state, mips.my_ALUOut.ALUOut);
    clk = 0;
    rst = 0;
    INT = 1;
    #1    rst =  1;
    #2    rst = 0;
    //#135  INT = 1;
    //#10   INT = 0;
    //#20   INT = 0;   
  end
  
  always
    #5 clk <= !clk;
endmodule
