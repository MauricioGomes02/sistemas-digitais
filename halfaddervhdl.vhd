-- half_adder.vhd

library ieee;
use ieee.std_logic_1164.all;

ENTITY halfaddervhdl IS 
  PORT (
		clk    : in std_logic;
		input  : in std_logic;
		reset  : in std_logic;
		output : out std_logic_vector(1 downto 0)
  );
END entity;

ARCHITECTURE arch OF halfaddervhdl IS
	type state_type is (s0,s1,s2,s3);
	signal state : state_type;
BEGIN
	process(clk, reset)
		begin
			if reset = '1' then
				state <= s0;
			elsif (rising_edge(clk)) then
				case state is
					when s0=> 
						if input = '1' then
							state <= s1;
						else
							state <= s0;
						end if;
					when s1=> 
						if input = '1' then
							state <= s2;
						else
							state <= s1;
						end if;
					when s2=> 
						if input = '1' then
							state <= s3;
						else
							state <= s2;
						end if;
					when s3=> 
						if input = '1' then
							state <= s0;
						else
							state <= s3;
						end if;
				end case;
			end if;							
		end process;
		
	process (state)
		begin
			case state is
				when s0 => 
					output <= "00";
				when s1 => 
					output <= "01";
				when s2 => 
					output <= "10";
				when s3 => 
					output <= "11";
			end case;
		end process;
END arch;