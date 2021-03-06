//Hazard Detection Unit (combinational element)
module HDU(
  input       MemRead_ex,
  input       MemRead_mem,
  input [4:0] Rs_id,
  input [4:0] Rt_id,
  input [4:0] Rt_ex,
  input [4:0] RD_ex,
  input [4:0] RD_mem,
  input       Jump_id,
  input [5:0] op_id,
  input       RegWrite_ex,
  input       RegWrite_mem,
  input [2:0] Branch_id,
  
  output stall_o,
  output PC_IFWrite_o
  );
  reg stall, PC_IFWrite;
  always@(*)
  begin
    if (MemRead_ex && ((Rt_ex == Rs_id) || (Rt_ex == Rt_id)))
      begin
        stall <= 1'b1;
        PC_IFWrite <= 1'b0;//forbit the update of PC and IF_ID
      end
    else if (MemRead_mem && (RD_mem == Rs_id) && Jump_id && !op_id)//jalr, jr
      begin
        stall  <= 1'b1;
        PC_IFWrite <= 1'b0;
      end
    else if ((Branch_id == 3'b0 || Branch_id == 3'b001) && ((Rs_id == RD_ex) || (Rt_id == RD_ex)) && RegWrite_ex)//beq, bne
      begin
        stall <= 1'b1;
        PC_IFWrite <= 1'b0;
      end
    else if ((Branch_id == 3'b0 || Branch_id == 3'b001) && ((Rs_id == RD_mem) || (Rt_id == RD_mem)) && RegWrite_mem)//beq, bne
      begin
        stall <= 1'b1;
        PC_IFWrite <= 1'b0;
      end
    else
      begin
        stall <= 1'b0;
        PC_IFWrite <= 1'b1;
      end
  end
  assign PC_IFWrite_o = PC_IFWrite;
  assign stall_o = stall;
endmodule
  
