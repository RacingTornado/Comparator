Library UNISIM;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use UNISIM.vcomponents.all;
entity lvd_buf is 
port(i1,i2 : inout STD_LOGIC;
     re : out STD_LOGIC);
end lvd_buf;

architecture rtl of lvd_buf is
-- IOBUFDS: Differential Bi-directional Buffer
-- Spartan-3E
-- Xilinx HDL Libraries Guide, version 13.4
begin
IOBUFDS_inst : IOBUFDS
generic map (
IBUF_DELAY_VALUE => "0", -- Specify the amount of added input delay for buffer,
-- "0"-"12"
IFD_DELAY_VALUE => "AUTO", -- Specify the amount of added delay for input register,
-- "AUTO", "0"-"6"
IOSTANDARD => "DEFAULT")
port map (
O => re, -- Buffer output
IO => i1, -- Diff_p inout (connect directly to top-level port)
IOB => i2, -- Diff_n inout (connect directly to top-level port)

T => '1' -- 3-state enable input, high=input, low=output
);
end rtl;
