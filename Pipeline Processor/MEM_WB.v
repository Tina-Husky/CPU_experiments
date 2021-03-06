//MEM/WB Register (state element)
module MEM_WB(
  input        clk,
  input        rst_n,
  input  [31:0]Signal_mem_i,
  input  [31:0]NPC_mem_i,
  input  [31:0]MD_i,
  input  [31:0]ALUOut_mem_i,
  input  [31:0]EXT_mem_i,
  input  [31:0]RD_mem_i,
  
  output [1:0] MemtoReg_wb_o,
  output       RegWrite_wb_o,
  output [31:0]NPC_wb_o,
  output [31:0]MD_wb_o,
  output [31:0]ALUOut_wb_o,
  output [31:0]EXT_wb_o,
  output [31:0]RD_wb_o
  );
  integer i;
  reg [31:0] MEM_WB_reg[5:0];
  /*
  MEM_WB_reg[0]: Signal_wb
  MEM_WB_reg[1]: NPC_wb
  MEM_WB_reg[2]: MDR_wb
  MEM_WB_reg[3]: ALUOut_wb
  MEM_WB_reg[4]: E_wb
  MEM_WB_reg[5]: RD_wb
  */
  always@(*)
  begin
    if (!rst_n)
      begin
        for (i = 0; i < 6; i = i+1)
          MEM_WB_reg[i] = 32'h0;
      end
  end
  
  always@(posedge clk)
  begin
    MEM_WB_reg[0] = Signal_mem_i;
    MEM_WB_reg[1] = NPC_mem_i;
    MEM_WB_reg[2] = MD_i;
    MEM_WB_reg[3] = ALUOut_mem_i;
    MEM_WB_reg[4] = EXT_mem_i;
    MEM_WB_reg[5] = RD_mem_i;
    $display("MEM/WB: Signal_wb = %8X, NPC_wb = %8X, MDR_wb = %8X, AR_mem = %8X, E_wb = %8X, RD_wb = %8X", 
      MEM_WB_reg[0], MEM_WB_reg[1], MEM_WB_reg[2], MEM_WB_reg[3], MEM_WB_reg[4], MEM_WB_reg[5]);
  end
  assign MemtoReg_wb_o = MEM_WB_reg[0][13:12];
  assign RegWrite_wb_o = MEM_WB_reg[0][14];
  assign NPC_wb_o = MEM_WB_reg[1];
  assign MD_wb_o = MEM_WB_reg[2];
  assign ALUOut_wb_o = MEM_WB_reg[3];
  assign EXT_wb_o = MEM_WB_reg[4];
  assign RD_wb_o = MEM_WB_reg[5];
endmodule
