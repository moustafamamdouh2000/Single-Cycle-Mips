----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:41:37 06/03/2021 
-- Design Name: 
-- Module Name:    Mux32B_MoustafaMamdouhSabry18101997 - Behavioral 
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

entity Mux5B_MoustafaMamdouhSabry18101997 is
    Port ( Input1: in  STD_LOGIC_VECTOR (4 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux5B_MoustafaMamdouhSabry18101997;
architecture Behavioral of Mux5B_MoustafaMamdouhSabry18101997 is
begin
process (Input1,Input2,Sel) begin
if(Sel='0') then
	Output<=Input1;
else
	Output<=Input2;
end if;
end process;
end Behavioral;