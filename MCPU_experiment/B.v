module B(
  input clk,
  input rst_n,
  input [31:0] Rdata2_i,//Regfile Read-data1
  
  output [31:0] data2_o
  );
  reg [31:0] B;
  always@(posedge clk or posedge rst_n)
  begin
    if (rst_n)
      B <= 32'h0;
    else
      B <= Rdata2_i;
  end
  assign data2_o = B;
endmodule

