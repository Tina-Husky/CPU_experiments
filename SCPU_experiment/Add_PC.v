//common PC Address (combinational element)
module Add_PC(//PC + 4
  input [31:0]  PC,
  output [31:0] new_PC_o
  );

  assign new_PC_o = PC + 4;	
endmodule

