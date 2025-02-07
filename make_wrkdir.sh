#! /bin/bash

wrkdir=$PWD/wrkdir
dir_3dvar=$PWD/3DVar
static_files_dir="$PWD"/TEMP #leave empty if you don't have static files

mkdir -p "$wrkdir"/DA__FREQ_1
mkdir -p "$wrkdir"/static_data/SAT_VAR
mkdir -p "$wrkdir"/static_data/EOF

cd $wrkdir

#link 3dvar executable
ln -sf "$dir_3dvar"/var_3d .

# namelists
cp ../files_wrkdir/var_3d_nml .
cp ../files_wrkdir/DA__FREQ_1/satfloat.20150101-00:00:00.nml DA__FREQ_1

if [ -d "$static_files_dir" ]
then
    echo "copying static files"

    # download grid
    cp "$static_files_dir"/grid1.nc .

    # download gradsal.nc
    cp "$static_files_dir"/gradsal.nc .

    # download sat variance
    cp "$static_files_dir"/SAT_VAR/* static_data/SAT_VAR

    # download EOFs
    cp "$static_files_dir"/EOF/* static_data/EOF

    # download correlation radious. Not needed with current namelist: var_3d_nml
    # cp "$static_files_dir"/chl_rad_corr.nc .
    
else
    echo "Warning: static_files_dir ('$static_files_dir') is not a directory. No static files will be copyed in the wrkdir ('$wrkdir')."
fi

# create launcher.sh
echo . "$dir_3dvar"/machine_module.sh > launcher.sh
# echo ./var_3d >> launcher.sh
echo mpiexec -n 8 ./var_3d >> launcher.sh

