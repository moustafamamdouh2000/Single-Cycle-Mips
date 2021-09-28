-- Create Date:    20:51:36 06/03/2021 
-- Design Name: 
-- Module Name:    ALUControl_MoustarfaMamdouhSabry18101997 - Behavioral 
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
entity ALUControl_MoustarfaMamdouhSabry18101997 is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           func : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUControl_MoustarfaMamdouhSabry18101997;
architecture Behavioral of ALUControl_MoustarfaMamdouhSabry18101997 is
signal temporary : STD_LOGIC_VECTOR(3 downto 0);
begin
temporary<=(0=>func(0),1=>func(1),2=>func(2),3=> func(3));
process(OP, func, temporary) begin
case OP is
	when "00" => Output <= "0010";
	when "01" => Output <= "0110";
	when "10" => 
		case temporary is
			when "0000" => Output <= "0010";
			when "0010" => Output <= "0110";
			when "0100" => Output <= "0000";
			when "0101" => Output <= "0001";
			when "1010" => Output <= "0111";
			when others => Output <= (others => '0');
		end case;
	when others => Output <= (others => '0');
end case;
end process;

end Behavioral;