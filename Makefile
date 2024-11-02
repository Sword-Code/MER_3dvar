include 3DVar/compiler.inc

EXEC = create_var_list.xx
VARLIST= DAvars.txt

$(EXEC) : bin 
	cd bin; $(LD) -c ../src/da_params.f90 ../src/create_var_list.f90; $(LD) -o $(EXEC) da_params.o create_var_list.o; cd ..; bin/$(EXEC)

bin : 
	mkdir -p bin
