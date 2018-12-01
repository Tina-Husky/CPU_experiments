library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Addr_i          : in     vl_logic_vector(31 downto 0);
        DataIn_i        : in     vl_logic_vector(31 downto 0);
        MemWrite_i      : in     vl_logic;
        BE_i            : in     vl_logic_vector(3 downto 0);
        Sign_i          : in     vl_logic;
        DataOut_o       : out    vl_logic_vector(31 downto 0)
    );
end Memory;