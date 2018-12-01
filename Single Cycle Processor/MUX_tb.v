module MUX_tb(
  );
  `timescale 1ns/1ps
  reg clk;
  reg [31:0] d0, d1, d2, d3;
  reg [31:0] tmp;
  reg [1:0] s;
  wire [31:0] data_o;
  integer fd, cnt;
  initial
  begin
    fd = $fopen("out.txt", "r");
    d0 = 32'h0;
    d1 = 32'h0;
    d2 = 32'h0;
    d3 = 32'h0;
    tmp = 32'h0;
    s = 2'b0;
    clk = 0;
  end
  always
    #10 clk <= ~clk;
  
  MUX #(2) my_MUX1_1(
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .s(s),
    .data_o(data_o)
    );
  
  always@(posedge clk)
  begin
    if (data_o != tmp)
      begin
        $display("testcase fail!");
        $stop;
      end
    cnt = $fscanf(fd, "%x%x%x%x%x%d", d0, d1, d2, d3, tmp, s);
    $display("%x\t%x\t%x\t%x\t%x\t%d /cnt:%d", d0, d1, d2, d3, data_o, s, cnt);
    if (cnt == -1)
      begin
        $display("Pass!");
        $fclose(fd);
        $stop;
      end
  end
endmodule