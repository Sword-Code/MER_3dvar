program create_var_list
use da_params, only: DA_VarList, NBioVar, jpk_200, SET_DA_PARAMS, CLEAN_DA_PARAMS
implicit none

integer :: my_unit=86
integer :: i
character(len=10) :: DAvars_file_name="DAvars.txt"
character(len=12) :: DAlevels_file_name="DAlevels.txt"


call SET_DA_PARAMS

OPEN(UNIT=my_unit, FILE=DAvars_file_name, ACTION= 'WRITE')
    do i=1, NBioVar
        write(my_unit,*) DA_VarList(i)
    end do
close(unit=my_unit)
write(*,*) DAvars_file_name, ' written.'

OPEN(UNIT=my_unit, FILE=DAlevels_file_name, ACTION= 'WRITE')
    write(my_unit,*) jpk_200
close(unit=my_unit)
write(*,*) DAlevels_file_name, ' written.'

call CLEAN_DA_PARAMS

end program
