-- Create Date:    20:11:43 06/03/2021 
-- Design Name: 
-- Module Name:   MIPSSingleCycle_MoustafaMamdouhSabry_18101997 - Behavioral 
-- Project Name: 	Single Cycle MIPS Prcocessor
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

entity MIPS_SingleCycle_MoustafaMamdouhSabry18101997 is
    Port ( CLK : in  STD_LOGIC:='0');
end MIPS_SingleCycle_MoustafaMamdouhSabry18101997;

architecture Behavioral of MIPS_SingleCycle_MoustafaMamdouhSabry18101997 is

component Adder_MoustafaMamdouhSabry18101997 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component InstructionMemory_MoustafaMamdouhSabry18101997 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end component;
component Mux5B_MoustafaMamdouhSabry18101997 is
    Port ( Input1: in  STD_LOGIC_VECTOR (4 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (4 downto 0));
end component;
component Mux32B_MoustafaMamdouhSabry18101997 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component PCUnit_MoustafaMamdouhSabry18101997 is
    Port ( PC_Input : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component ControlUnit_MoustafaMamdouhSabry18101997 is
    Port ( OPCode : in  STD_LOGIC_VECTOR (5 downto 0);
           REGDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
component SignExtend_MoustafaMamdouhSabry18101997 is
    Port ( Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ShitLeft_MoustafaMamdouhSabry18101997 is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component ALUControl_MoustarfaMamdouhSabry18101997 is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           func : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
component ALUMain_MoustafaMamdouhSabry18101997 is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selectors : in  STD_LOGIC_VECTOR (3 downto 0);
           ALUOperation : out  STD_LOGIC_VECTOR (31 downto 0);
           ZERO_FLAG : out  STD_LOGIC);
end component;
component Register_MoustafamamdouhSabry18101997 is
    Port ( regWrite : in  STD_LOGIC;
           readReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writeReg : in  STD_LOGIC_VECTOR (4 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           readData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           readData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component DataMemory_MoustafaMamdouhSabry18101997 is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           CLK : in  STD_LOGIC :='0';
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
--PC Signals
signal PCin : STD_LOGIC_VECTOR (31 downto 0);
signal PCout : STD_LOGIC_VECTOR (31 downto 0);
signal PC_Adder_Out : STD_LOGIC_VECTOR (31 downto 0);
signal PC_Branch_Out: STD_LOGIC_VECTOR (31 downto 0);
--Control Signals
signal ALUSrc : STD_LOGIC;
signal regWrite : STD_LOGIC;
signal regDest : STD_LOGIC;
signal Branch : STD_LOGIC;
signal memRead : STD_LOGIC;
signal memtoReg : STD_LOGIC;
signal ALUOp : STD_LOGIC_VECTOR (1 downto 0);
--other signals
signal memWrite : STD_LOGIC;
signal ALUSrc_OUT : STD_LOGIC_VECTOR (31 downto 0);
signal SignExtend_Out: STD_LOGIC_VECTOR (31 downto 0);
signal ShiftLeft_Out: STD_LOGIC_VECTOR (31 downto 0);
signal WriteReg : STD_LOGIC_VECTOR (4 downto 0);
signal WriteData : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData1 : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData2 : STD_LOGIC_VECTOR (31 downto 0);
signal MemData : STD_LOGIC_VECTOR (31 downto 0);
signal Zero_Flagg : STD_LOGIC;
signal ALUSelectors : STD_LOGIC_VECTOR (3 downto 0);
signal ALUOp_Code : STD_LOGIC_VECTOR (31 downto 0);
--Instructions Signals
signal Instructions_31B : STD_LOGIC_VECTOR (31 downto 0);
signal Instructions_31_26 : STD_LOGIC_VECTOR (5 downto 0);
signal Instructions_25_21 : STD_LOGIC_VECTOR (4 downto 0);
signal Instructions_20_16 : STD_LOGIC_VECTOR (4 downto 0);
signal Instructions_15_11 : STD_LOGIC_VECTOR (4 downto 0);
signal Instructions_15_0: STD_LOGIC_VECTOR (15 downto 0);
signal Instructions_5_0 : STD_LOGIC_VECTOR (5 downto 0);
--Test for the anding ( not working for some reason when i write normally )
signal Test :STD_LOGIC;

begin
Instructions_31_26 <= Instructions_31B(31 downto 26);
Instructions_25_21 <= Instructions_31B(25 downto 21);
Instructions_20_16 <= Instructions_31B(20 downto 16);
Instructions_15_11 <= Instructions_31B(15 downto 11);
Instructions_15_0 <= Instructions_31B(15 downto 0);
Instructions_5_0 <= Instructions_31B(5 downto 0);
Test<=Zero_Flagg and Branch;
--InstructionMemory
InstructionMemory: InstructionMemory_MoustafaMamdouhSabry18101997 port map(PCout,Instructions_31B);
--PCUnit
PC_Unit: PCUnit_MoustafaMamdouhSabry18101997 port map(PCin,CLK,PCout);
--Control
ControlUnit:ControlUnit_MoustafaMamdouhSabry18101997 port map (Instructions_31_26, regDest, ALUSrc,memtoReg ,regWrite, memWrite ,memRead ,Branch ,ALUOp); 
--SignExtend and ShiftLeft
ShiftLeft2_Unit: ShitLeft_MoustafaMamdouhSabry18101997 port map (SignExtend_Out,ShiftLeft_Out);
SignExtend_Unit: SignExtend_MoustafaMamdouhSabry18101997 port map (Instructions_15_0, SignExtend_Out);
--ALU
ALU_MainUnit: ALUMain_MoustafaMamdouhSabry18101997 port map (ReadData1, ALUSrc_OUT, ALUSelectors, ALUOp_Code, Zero_Flagg);  
ALUControl_Unit: ALUControl_MoustarfaMamdouhSabry18101997 port map (ALUOp, Instructions_5_0, ALUSelectors);
--Adders
Branch_Adder: Adder_MoustafaMamdouhSabry18101997 port map (PC_Adder_Out, ShiftLeft_Out, PC_Branch_Out);
PC_Adder: Adder_MoustafaMamdouhSabry18101997 port map (PCout, STD_LOGIC_VECTOR(to_unsigned(4, 32)), PC_Adder_Out);
--Register and Memory
RegisterFile: Register_MoustafamamdouhSabry18101997 port map (regWrite, Instructions_25_21, Instructions_20_16, WriteReg,WriteData , CLK, ReadData1, ReadData2);
MemoryUnit: DataMemory_MoustafaMamdouhSabry18101997 port map (ALUOp_Code,memRead ,memWrite ,CLK , ReadData2 ,MemData);
--Muxes
regDstMux: Mux5B_MoustafaMamdouhSabry18101997 port map (Instructions_20_16,Instructions_15_11,regDest,WriteReg);
BranchMux: Mux32B_MoustafaMamdouhSabry18101997 port map (PC_Adder_Out, PC_Branch_Out,Test,PCin);
ALUSrcMux: Mux32B_MoustafaMamdouhSabry18101997 port map (ReadData2,SignExtend_Out,ALUSrc,ALUSrc_OUT);
memtoRegMux: Mux32B_MoustafaMamdouhSabry18101997 port map(ALUOp_Code,MemData,memtoReg,WriteData);
end Behavioral;

