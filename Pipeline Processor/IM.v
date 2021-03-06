//Instrution Memory(combinational element)
module IM(
  input  [31:0] ImAddr_i,
  output [31:0] Instr_o
  );
  
	reg  [31:0] IMem[5096:0];//word address(the number of words)
	reg  [31:0] Instr;
	wire [31:0] Opcode;
	assign Opcode = {2'b0, ImAddr_i[31:2]};//ImAddress shifts right for two bits

	initial
	begin
	  $readmemh("test.txt", IMem, 12'hc00);
	end
		always@(ImAddr_i)
	begin
		Instr = IMem[Opcode];	
	end
	assign Instr_o = Instr;
endmodule







