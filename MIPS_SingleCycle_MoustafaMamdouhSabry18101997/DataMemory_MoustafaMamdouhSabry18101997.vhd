----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:03 06/03/2021 
-- Design Name: 
-- Module Name:    DataMemory_MoustafaMamdouhSabry18101997 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory_MoustafaMamdouhSabry18101997 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC :='0';
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory_MoustafaMamdouhSabry18101997;
architecture Behavioral of DataMemory_MoustafaMamdouhSabry18101997 is
type memory is array (0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
signal Temp_Memory : memory:=
				(x"43",x"6F",x"6D",x"70",
            x"75",x"74",x"65",x"72",
            x"20",x"41",x"72",x"63",
            x"68",x"69",x"74",x"65",
            x"63",x"74",x"75",x"72",
            x"65",x"20",x"32",x"30",
            x"32",x"31",x"21",x"21",
            x"32",x"31",x"21",x"21",
            x"00",x"00",x"00",x"00",
others => x"00");
begin
	process (MemRead,MemWrite,clk)
	begin
		if (falling_edge (CLK) and memRead ='1' and memWrite ='0') then
			readData <= Temp_Memory(to_integer(unsigned(Address)))&
							Temp_Memory(to_integer(unsigned(Address))+1)&
							Temp_Memory(to_integer(unsigned(Address))+2)&
							Temp_Memory(to_integer(unsigned(Address))+3);
		end if;
		if (rising_edge (CLK) and memRead ='0' and memWrite ='1') then
			Temp_Memory(to_integer(unsigned(Address)))<=writeData (31 downto 24);
			Temp_Memory(to_integer(unsigned(Address))+1)<=writeData (23 downto 16);
			Temp_Memory(to_integer(unsigned(Address))+2)<=writeData (15 downto 8);
			Temp_Memory(to_integer(unsigned(Address))+3)<=writeData (7 downto 0);
		end if;
	end process;
end Behavioral;

