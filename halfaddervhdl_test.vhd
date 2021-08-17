-- half_adder_simple_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity halfaddervhdl_test is
end halfaddervhdl_test;

architecture tb of halfaddervhdl_test is
    signal clk,input,reset : std_logic;  -- inputs 
    signal output          : std_logic_vector(1 downto 0);  -- outputs
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.halfaddervhdl port map (clk => clk, input => input, reset => reset, 
	 output => output);

    -- inputs
    -- 00 at 0 ns
    -- 01 at 20 ns, as b is 0 at 20 ns and a is changed to 1 at 20 ns
    -- 10 at 40 ns
    -- 11 at 60 ns
	 clk <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    input <= '1';
	 reset <= '0';
end tb ;