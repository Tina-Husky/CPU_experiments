`define ALUOP_NOP   5'd0  //No Operation

`define R_type      6'b0
`define ORI         6'b001101
`define LW          6'b100011
`define SW          6'b101011
`define BEQ         6'b000100
`define JAL         6'b000011
`define J           6'b000010

`define ALUOP_ADD   5'd1
`define ALUOP_SUB   5'd2
`define ALUOP_SLT   5'd3  //Set on Less Than
`define ALUOP_SLTU  5'd4  //Set on Less Than Unsigned

`define ALUOP_DIV   5'd5  //
`define ALUOP_DIVU  5'd6  //
`define ALUOP_MULT  5'd7  //
`define ALUOP_MULTU 5'd8  //

`define ALUOP_AND   5'd9
`define ALUOP_NOR   5'd10
`define ALUOP_OR    5'd11
`define ALUOP_LUI   5'd12

`define ALUOP_SLL   5'd13  //Shift Word Left Logical
`define ALUOP_SRL   5'd14  //Shift Word Right Logical
`define ALUOP_SRA   5'd15  //Shift Word Right Arithmetic