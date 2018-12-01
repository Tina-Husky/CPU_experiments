library verilog;
use verilog.vl_types.all;
entity Regfile is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        RegWrite_i      : in     vl_logic;
        wa_i            : in     vl_logic_vector(4 downto 0);
        ra1_i           : in     vl_logic_vector(4 downto 0);
        ra2_i           : in     vl_logic_vector(4 downto 0);
        wd_i            : in     vl_logic_vector(31 downto 0);
        rd1_o           : out    vl_logic_vector(31 downto 0);
        rd2_o           : out    vl_logic_vector(31 downto 0)
    );
end Regfile;
