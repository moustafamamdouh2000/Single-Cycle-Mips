----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:18 06/03/2021 
-- Design Name: 
-- Module Name:    Adder_MoustafaMamdouhSabry18101997 - Behavioral 
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
entity Adder_MoustafaMamdouhSabry18101997 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder_MoustafaMamdouhSabry18101997;
architecture Behavioral of Adder_MoustafaMamdouhSabry18101997 is
begin
Output <= STD_LOGIC_VECTOR(to_unsigned((to_integer(unsigned(Input1))+to_integer(unsigned(Input2))),32));
end Behavioral;

