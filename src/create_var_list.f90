program create_var_list
use da_params, only: DA_VarList, NBioVar, SET_DA_PARAMS, CLEAN_DA_PARAMS
implicit none

integer :: my_unit=86
integer :: i
character(len=10) :: file_name="DAvars.txt"

call SET_DA_PARAMS

OPEN(UNIT=my_unit, FILE=file_name, ACTION= 'WRITE')
    do i=1, NBioVar
        write(my_unit,*) DA_VarList(i)
    end do
close(unit=my_unit)

write(*,*) file_name, 'written.'

call CLEAN_DA_PARAMS

end program
