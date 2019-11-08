library ieee;
  use ieee.std_logic_1164.all;
  
library lib_1;
library lib_2;


entity tb_my_entity is
end entity;

architecture tb of tb_my_entity is

    constant C_CLK_PERIOD : time := 10 ns;
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal i   : std_logic;
    
    signal o_1 : std_logic;
    signal o_2 : std_logic;
    
begin

    clk <= not clk after C_CLK_PERIOD / 2;

    my_entity_1 : entity lib_1.my_entity
    port map (
        clk => clk,
        rst => rst,
        i => i,
        o => o_1
    );


    my_entity_2 : entity lib_2.my_entity
    port map (
        clk => clk,
        rst => rst,
        i => i,
        o => o_2
    );

    generate_input : process
    begin
        wait for C_CLK_PERIOD;
        rst <= '1';
        wait for C_CLK_PERIOD;
        rst <= '0';
        wait for 5 * C_CLK_PERIOD;
    
        std.env.finish;
    end process generate_input;
    
    check_outputs : process(clk)
    begin
        if rising_edge(clk) then
            assert o_1  = o_2 report "output mismatch" severity failure;
        end if;
    end process check_outputs;
    
end architecture tb;
