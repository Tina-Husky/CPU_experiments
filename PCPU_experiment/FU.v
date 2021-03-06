//Forwarding Unit (combinational element)
module FU(
  input [4:0] Rs_id,//for jalr
  input       Jump_id,
  input [4:0] Rs_ex,
  input [4:0] Rt_ex,
  input [4:0] Rd_ex,
  input [4:0] Rd_mem,
  input [4:0] Rd_wb,
  input [5:0] op_id,
  input [5:0] op_ex,
  input       MemWrite_ex,
  input       RegWrite_ex,
  input       RegWrite_mem,
  input       RegWrite_wb,
  
  output[1:0] ForwardA_o,
  output[1:0] ForwardB_o,
  output[1:0] ForwardC_o,
  output[1:0] ForwardD_o
  );
  reg [1:0] ForwardA, ForwardB, ForwardC, ForwardD;
  always@(*)
  begin
    //ForwardA
    if (RegWrite_mem && (Rd_mem != 4'b0) && (Rd_mem == Rs_ex))//EX hazard
      ForwardA = 2'd1;
    else if (RegWrite_wb && (Rd_wb != 4'b0) && (Rd_wb == Rs_ex))//MEM hazard
      ForwardA = 2'd2;
    else ForwardA = 2'd0;
    //ForwardB
    if (RegWrite_mem && (Rd_mem != 4'b0) && (Rd_mem == Rt_ex) && !op_ex)//EX hazard(R-type)
      ForwardB = 2'd1;
    else if (RegWrite_wb && (Rd_wb != 4'b0) && (Rd_wb == Rt_ex) && !op_ex)//MEM hazard(R-type)
      ForwardB = 2'd2;
    else ForwardB = 2'b0;
    //ForwardC
    if (RegWrite_mem && (Rd_mem != 4'b0) && (Rd_mem == Rt_ex) && MemWrite_ex)//EX hazard(store)
      ForwardC = 2'd1;
    else if (RegWrite_wb && (Rd_wb != 4'b0) && (Rd_wb == Rt_ex) && MemWrite_ex)//MEM hazard(store)
      ForwardC = 2'd2;
    else ForwardC = 2'b0;
    //ForwardD
    if (RegWrite_ex && (Rd_ex != 4'b0) && (Rd_ex == Rs_id) && Jump_id && !op_id)//jr jalr
      ForwardD = 2'b01;
    else if (RegWrite_mem && (Rd_mem != 4'b0) && (Rd_mem == Rs_id) && Jump_id && !op_id)
      ForwardD = 2'b10;
    else if (RegWrite_wb && (Rd_wb != 4'b0) && (Rd_wb == Rs_id) && Jump_id && !op_id) 
      ForwardD = 2'b11;
    else
      ForwardD = 2'b0;
  end
  assign ForwardA_o = ForwardA;
  assign ForwardB_o = ForwardB;
  assign ForwardC_o = ForwardC;
  assign ForwardD_o = ForwardD;
endmodule