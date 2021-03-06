module Branch_Ctrl(
  input [2:0]  Branch_i,//signal to determine which branch instruction is executing
  input [31:0] rd1_i,//rs, read data
  input [31:0] rd2_i,//rt, read data
  
  output       enable_o
  );
  reg enable, Zero;
  reg [31:0] outcome;
  always@(*)
  begin
    outcome = rd1_i - rd2_i;
    if (outcome) Zero = 1'b0;
    else Zero = 1'b1;
    if (Branch_i == 3'b000)//beq
      begin
        if (Zero == 1'b1) enable = 1'b1;
        else enable = 1'b0;
      end
    else if (Branch_i == 3'b001)//bne
      begin
        if (Zero == 1'b0) enable = 1'b1;
        else enable = 1'b0;
      end
    else if (Branch_i == 3'b100)//blez
      begin
        if (Zero == 1'b0 && rd1_i[31] == 0) enable = 1'b0;
        else enable = 1'b1;
      end
    else if (Branch_i == 3'b010)//bgtz
      begin
        if (Zero == 1'b0 && rd1_i[31] == 0) enable = 1'b1;
        else enable = 1'b0;
      end
    else if (Branch_i == 3'b011)//bltz
      begin
        if (rd1_i[31]) enable = 1'b1;
        else enable = 1'b0;
      end
    else if (Branch_i == 3'b101)//bgez
      begin
        if (rd1_i[31]) enable = 1'b0;
        else enable = 1'b1;
      end
    else enable = 1'b0;
  end
  assign enable_o = enable;
endmodule
