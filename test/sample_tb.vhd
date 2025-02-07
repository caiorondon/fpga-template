
library ieee;
use ieee.std_logic_1164.all;

entity tb_top is
end entity;

architecture sim of tb_top is
  signal clk : std_logic := '0';
  signal led : std_logic;
begin
  -- Instantiate DUT
  DUT: entity work.top
    port map (
      clk => clk,
      led => led
    );

  -- Clock generation
  process
  begin
    clk <= '0'; wait for 10 ns;
    clk <= '1'; wait for 10 ns;
  end process;
end architecture;
