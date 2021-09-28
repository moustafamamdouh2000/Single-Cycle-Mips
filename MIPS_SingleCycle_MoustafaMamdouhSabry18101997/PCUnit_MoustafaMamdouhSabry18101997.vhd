----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:13 06/03/2021 
-- Design Name: 
-- Module Name:    PCUnit_MoustafaMamdouhSabry18101997 - Behavioral 
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

entity PCUnit_MoustafaMamdouhSabry18101997 is
    Port ( PC_Input : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end PCUnit_MoustafaMamdouhSabry18101997;

architecture Behavioral of PCUnit_MoustafaMamdouhSabry18101997 is

signal Temp : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
process(CLK) begin
	if(rising_edge(CLK)) then PCout <= Temp;
	end if;
	if(falling_edge(CLK)) then Temp <= PC_Input;
	end if;
end process;

end Behavioral;