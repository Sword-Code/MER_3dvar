from pathlib import Path 
from shutil import copy2

wrkdir=Path('wrkdir')
dir_3dvar=Path('3DVar')
static_files_dir=Path('static_files') #leave empty if you don't have static files

DA__FREQ_1=wrkdir/'DA__FREQ_1'
DA__FREQ_1.mkdir(parents=True, exist_ok=True)
(wrkdir/'static_data/SAT_VAR').mkdir(parents=True, exist_ok=True)
(wrkdir/'static_data/EOF').mkdir(parents=True, exist_ok=True)

#link 3dvar executable
(wrkdir/'var_3d').symlink_to((dir_3dvar/'var_3d').absolute())

# namelists
copy2(Path('files_wrkdir/var_3d_nml'), wrkdir)
copy2(Path('files_wrkdir/DA__FREQ_1/satfloat.20150101-00:00:00.nml'), DA__FREQ_1)

if static_files_dir.is_dir():
    
    # download namelist
    print('copying var_3d_nml')
    copy2(static_files_dir/'var_3d_nml', wrkdir)
    
    # download grid
    print('copying grid1.nc')
    copy2(static_files_dir/'grid1.nc', wrkdir)
    
    # download gradsal.nc
    print('copying gradsal.nc')
    copy2(static_files_dir/'gradsal.nc', wrkdir)
    
    # download correlation radious. Not needed with current namelist: var_3d_nml
    # copy2(static_files_dir/'chl_rad_corr.nc', wrkdir)
    
    # download sat variance
    for f in [f'var2D.{i:02}.nc' for i in range(1,13)]:
        print(f'copying {f}')
        copy2(static_files_dir/f, wrkdir/'static_data/SAT_VAR'/f)

    # download EOFs
    for f in [f'eof.{i:02}.nc' for i in range(1,13)]:
        print(f'copying {f}')
        copy2(static_files_dir/f, wrkdir/'static_data/EOF'/f)
    
else:
    print(f"Warning: static_files_dir ('{static_files_dir}') is not a directory. No static files will be copyed in the wrkdir ('{wrkdir}').")


# create launcher.sh
with open(wrkdir/"launcher.sh", 'w') as f:
    f.writelines([f"{dir_3dvar.absolute()/'machine_module.sh'}\n",
                  "mpiexec -n 8 ./var_3d"])
    

 
