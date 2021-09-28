----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:07 06/03/2021 
-- Design Name: 
-- Module Name:    ControlUnit_MoustafaMamdouhSabry18101997 - Behavioral 
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

entity ControlUnit_MoustafaMamdouhSabry18101997 is
    Port ( OPCode : in  STD_LOGIC_VECTOR (5 downto 0);
           regDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           memtoReg : out  STD_LOGIC;
           regWrite : out  STD_LOGIC;
           memWrite : out  STD_LOGIC;
           memRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0));
end ControlUnit_MoustafaMamdouhSabry18101997;
architecture Behavioral of ControlUnit_MoustafaMamdouhSabry18101997 is
begin
the_process : process(OPCode)
begin
case OPCode is
	when "000000" =>
		regDst <='1';
		ALUSrc <='0';
		memtoReg <='0';
		regWrite <='1';
		memWrite <='0';
		memRead <='0';
		Branch <='0';
		ALUop <= "10";
	when "100011" =>
		regDst <='0';
		ALUSrc <='1';
		memtoReg <='1';
		regWrite <='1';
		memWrite <='0';
		memRead <='1';
		Branch <='0';
		ALUop <= "00";
	when "101011" =>
		ALUSrc <='1';
		regWrite <='0';
		memWrite <='1';
		memRead <='0';
		Branch <='0';
		ALUop <="00";
	when "000100" =>
		ALUSrc <='0';
		regWrite <='0';
		memWrite <='0';
		memRead <='0';
		Branch <='1';
		ALUop <="01";
	when "001000" => 
		ALUop <= "00";
		regDst <= '0';
		ALUSrc <= '1';
		memtoReg <= '0';
		regWrite <= '1';
		memRead <= '0';
		memWrite <= '0';
		Branch <= '0';
	when others => null;
end case;
end process;
end Behavioral;

