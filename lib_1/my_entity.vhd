library ieee;

use ieee.std_logic_1164.all;

entity my_entity is
    port (
        clk : in   std_logic;
        rst : in   std_logic;
        i   : in   std_logic;
        o   : out  std_logic
    );
end entity my_entity;

architecture rtl of my_entity is

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1'  then
                o <= '0';
            else
                o <= '1';
            end if;
        end if;
    end process;

end architecture rtl;
