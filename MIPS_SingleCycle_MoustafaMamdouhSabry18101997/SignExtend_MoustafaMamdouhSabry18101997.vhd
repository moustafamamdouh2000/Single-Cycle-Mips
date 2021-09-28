----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:43:08 06/03/2021 
-- Design Name: 
-- Module Name:    SignExtend_MoustafaMamdouhSabry18101997 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity SignExtend_MoustafaMamdouhSabry18101997 is
    Port ( Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtend_MoustafaMamdouhSabry18101997;
architecture Behavioral of SignExtend_MoustafaMamdouhSabry18101997 is
begin
process(Input) begin
	if(Input(15) = '1') then
		Output <= x"FFFF"&Input;
	else 
		Output <= x"0000"&Input;
	end if;
end process;
end Behavioral;
