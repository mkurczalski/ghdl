library ieee;
use ieee.std_logic_1164.all;

library ieee;
use ieee.numeric_std.all;

entity add_508 is
	port (
		result : out std_logic_vector(31 downto 0);
		in_a : in  std_logic_vector(31 downto 0);
		in_b : in  std_logic_vector(31 downto 0)
	);
end add_508;

architecture augh of add_508 is

	signal carry_inA : std_logic_vector(33 downto 0);
	signal carry_inB : std_logic_vector(33 downto 0);
	signal carry_res : std_logic_vector(33 downto 0);

begin

	-- To handle the CI input, the operation is '1' + CI
	-- If CI is not present, the operation is '1' + '0'
	carry_inA <= '0' & in_a & '1';
	carry_inB <= '0' & in_b & '0';
	-- Compute the result
	carry_res <= std_logic_vector(unsigned(carry_inA) + unsigned(carry_inB));

	-- Set the outputs
	result <= carry_res(32 downto 1);

end architecture;
