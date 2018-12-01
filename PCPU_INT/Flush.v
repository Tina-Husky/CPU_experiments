module Flush(
  input   enable_i,
  input   Jump_i,
  input   Exception_i,
  
  output  IF_flush_o
  );
  reg IF_flush;
  always@(*)
  begin
    if (Jump_i || Exception_i || enable_i)
      IF_flush = 1'b1;
    else
      IF_flush = 1'b0;
  end
  assign IF_flush_o = IF_flush;
endmodule
