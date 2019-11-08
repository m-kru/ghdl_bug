
all:
	ghdl -a --std=08 --work=lib_1 lib_1/my_entity.vhd
	ghdl -a --std=08 --work=lib_2 lib_2/my_entity.vhd
	ghdl -a --std=08 tb_my_entity.vhd
	ghdl --elab-run --std=08 tb_my_entity

clean:
	rm e~tb_my_entity.lst
	rm *.cf
	rm *.o
