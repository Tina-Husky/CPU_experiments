`include "Instruction_def.v"
//ALU control (conbinational element)
module ALU_Ctrl(
  input  [5:0] funct_i,//function code, Instr[5-0]
  input  [2:0] ALUOp_i,//signal from Ctrl
  
  output [4:0] ALUOP_o//ALU control input(5 bits)
  );
  reg [4:0] ALUOP;
  always@(*)
  begin
    case (ALUOp_i)
      3'b010://R-type
      begin
        case(funct_i)
          6'b100000://add
            ALUOP <= `ALUOP_ADD;
          6'b100001://addu
            ALUOP <= `ALUOP_ADD;
          6'b100010://sub
            ALUOP <= `ALUOP_SUB;
          6'b100011://subu
            ALUOP <= `ALUOP_SUB;
          6'b000000://sll
            ALUOP <= `ALUOP_SLL;
          6'b000010://srl
            ALUOP <= `ALUOP_SRL;
          6'b000011://sra
            ALUOP <= `ALUOP_SRA;
          6'b000100://sllv
            ALUOP <= `ALUOP_SLL;
          6'b000110://srlv
            ALUOP <= `ALUOP_SRL;
          6'b000111://srav
            ALUOP <= `ALUOP_SRA;
          6'b100100://and
            ALUOP <= `ALUOP_AND;
          6'b100101://or
            ALUOP <= `ALUOP_OR;
          6'b100110://xor
            ALUOP <= `ALUOP_XOR;
          6'b100111://nor
            ALUOP <= `ALUOP_NOR;
          6'b101010://slt
            ALUOP <= `ALUOP_SLT;
          6'b101011://sltu
            ALUOP <= `ALUOP_SLTU;
        endcase
      end
      3'b000://sw/sh/sb/lw/lh/lhu/lb/lbu/addi/addiu
        ALUOP <= `ALUOP_ADD;
      3'b001://andi
        ALUOP <= `ALUOP_AND;
      3'b011://ori
        ALUOP <= `ALUOP_OR;
      3'b100://xori
        ALUOP <= `ALUOP_XOR;
      3'b101://beq/bne/blez/bgtz/bltz/bgtz
        ALUOP <= `ALUOP_SUB;
        //ALUOP <= `ALUOP_SUB;
      3'b110://slti
        ALUOP <= `ALUOP_SLT;
      3'b111://sltiu
        ALUOP <= `ALUOP_SLTU;
    endcase
  end
  assign ALUOP_o = ALUOP;
endmodule