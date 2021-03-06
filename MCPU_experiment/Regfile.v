//Register File
module Regfile(
  input clk,
  input rst_n,
  input RegWrite_i,
  input [4:0]wa_i, //rt or rd, write address
  input [4:0]ra1_i,//rs, read address 1 (Register number)
  input [4:0]ra2_i,//rt, read address 2 (Register number)
  input [31:0]wd_i,//write data
  
  output [31:0]rd1_o,  //rs, read data
  output [31:0]rd2_o   //rt, read data
  );
  
  reg [31:0] Regfile [31:0]; //31 31-bit register
  integer    i;
  
  always@(posedge clk or posedge rst_n)
  begin
    if (rst_n)
      begin
        for (i = 1'b0; i < 32; i = i+1)
          Regfile[i] = 32'h0;
      end
    else
      begin
        if (RegWrite_i)
          begin
            Regfile[wa_i] = (!wa_i)? 32'h0 : wd_i;//only if the Regfile[wa_i] is not $zero
            $display("R[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Regfile[0], Regfile[1], Regfile[2], Regfile[3], Regfile[4], Regfile[5], Regfile[6], Regfile[7]);
            $display("R[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Regfile[8], Regfile[9], Regfile[10], Regfile[11], Regfile[12], Regfile[13], Regfile[14], Regfile[15]);
            $display("R[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Regfile[16], Regfile[17], Regfile[18], Regfile[19], Regfile[20], Regfile[21], Regfile[22], Regfile[23]);
            $display("R[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Regfile[24], Regfile[25], Regfile[26], Regfile[27], Regfile[28], Regfile[29], Regfile[30], Regfile[31]);
          end
      end
    //$write("rd1_o = 0x%x, rd2_o = 0x%x\t", Regfile[ra1_i], Regfile[ra2_i]);
  end
  //no other control inputs are needed. Read the content of the register anytime.
  assign rd1_o = Regfile[ra1_i];
  assign rd2_o = Regfile[ra2_i];
endmodule

/*
$zero     0      The constant value 0
$at       1      Reserved for the assembler
$v0-$v1   2-3    Values for results and expression evalution
$a0-$a3   4-7    Arguments
$t0-$t7   8-15   Temporaries
$s0-$s7   16-23  Saved
$t8-$t9   24-25  More temporaries
$k0-$k1   26-27  Reserved for the operating system
$gp       28     Global pointer
$sp       29     Stack pointer
$fp       30     Frame pointer
$ra       31     return address
*/


