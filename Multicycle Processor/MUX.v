module MUX(d0, d1, d2, d3, d4, d5, d6, d7, s, data_o);
  input [31:0] d0;
  input [31:0] d1;
  input [31:0] d2;
  input [31:0] d3;
  input [31:0] d4;
  input [31:0] d5;
  input [31:0] d6;
  input [31:0] d7;
  parameter width = 1;
  input [width-1:0]  s;//signal
  output [31:0] data_o;
  reg [31:0] data;
  always@(*)
  begin
    if (width == 1)
      case (s)
        1'b0: data <= d0;
        1'b1: data <= d1;
        default: data <= 1'b0;
      endcase
    else if (width == 2)
      case(s)
        2'b00: data <= d0;
        2'b01: data <= d1;
        2'b10: data <= d2;
        2'b11: data <= d3;
        default: data <= 2'b0;
      endcase
    else if (width == 3)
      case(s)
        3'b000: data <= d0;
        3'b001: data <= d1;
        3'b010: data <= d2;
        3'b011: data <= d3;
        3'b100: data <= d4;
        3'b101: data <= d5;
        3'b110: data <= d6;
        3'b111: data <= d7;
        default: data <= 2'b0;
      endcase
  end
  assign data_o = data;
endmodule