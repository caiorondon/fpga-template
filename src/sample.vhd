
library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk : in std_logic;
    led : out std_logic
  );
end entity;

architecture rtl of top is
  signal counter : integer := 0;
  signal blink   : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      counter <= counter + 1;
      if counter = 50000000 then
        blink <= not blink;
        counter <= 0;
      end if;
    end if;
  end process;

  led <= blink;
end architecture;
