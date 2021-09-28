----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:59 06/03/2021 
-- Design Name: 
-- Module Name:    ALUMain_MoustafaMamdouhSabry18101997 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUMain_MoustafaMamdouhSabry18101997 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selectors : in  STD_LOGIC_VECTOR (3 downto 0);
           ALUOperation : out  STD_LOGIC_VECTOR (31 downto 0);
           ZERO_FLAG : out  STD_LOGIC);
end ALUMain_MoustafaMamdouhSabry18101997;
architecture Behavioral of ALUMain_MoustafaMamdouhSabry18101997 is
signal Temp_Output:std_logic_vector(31 downto 0);
signal ZERO:std_Logic;
begin
process(Input1,Input2,Selectors,Temp_Output)
begin
case (Selectors) is
	when "0000"=>Temp_Output<= Input1 AND Input2;
	when "0001"=>Temp_Output<= Input1 OR Input2;
	when "0010"=>Temp_Output<= Input1+Input2;                           
	when "0110"=>Temp_Output<= Input1-Input2;
	when "0111"=>If(Input1<Input2)then
			Temp_Output<= (0=>'1',others=>'0');
		else
			Temp_Output<=(others=>'0');
		end if;
	when "1100"=>Temp_Output<= Input1 NOR Input2;
	when others=>Temp_Output<= (others=>'0');
end case;
	if(Input1=Input2) then 
		ZERO<= '1';
	else
		ZERO<='0';
	end if;
end process;
ALUOperation<=Temp_Output;
ZERO_FLAG<=ZERO;
end Behavioral;