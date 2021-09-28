----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:46 06/03/2021 
-- Design Name: 
-- Module Name:    Register_MoustafamamdouhSabry18101997 - Behavioral 
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

entity Register_MoustafamamdouhSabry18101997 is
    Port ( regWrite : in  STD_LOGIC;
           readReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writeReg : in  STD_LOGIC_VECTOR (4 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           readData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           readData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_MoustafamamdouhSabry18101997;

architecture Behavioral of Register_MoustafamamdouhSabry18101997 is
type Registers is array(0 to 31) of STD_LOGIC_VECTOR ( 31 downto 0);
signal Temp_Regs : Registers:= (4=>x"00000000",5=>x"0000003C", Others=>x"00000000");
begin
process (CLK,regWrite)
	begin
		readData1<= Temp_Regs(to_integer(unsigned(readReg1)));
		readData2<= Temp_Regs(to_integer(unsigned(readReg2)));
		if rising_edge(CLK) and regWrite='1' then
			Temp_Regs(to_integer(unsigned(writeReg)))<=writeData;
		end if;
	end process;
end Behavioral;

