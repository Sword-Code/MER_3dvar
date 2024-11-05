#! /bin/bash

downloads="$PWD"/../TEMP

wrkdir=$PWD/wrkdir
dir_3dvar=$PWD/3DVar

mkdir -p "$wrkdir"/DA__FREQ_1
mkdir -p "$wrkdir"/static_data

cd $wrkdir

#link 3dvar executable
ln -sf "$dir_3dvar"/var_3d .

# namelists
cp ../files_wrkdir/var_3d_nml .
cp ../files_wrkdir/DA__FREQ_1/satfloat.20150101-00:00:00.nml DA__FREQ_1

# download grid
cp "$downloads"/grid1.nc .

# download gradsal.nc
cp "$downloads"/gradsal.nc .

# download sat variance
cp -r "$downloads"/SAT_VAR static_data/SAT_VAR

# download EOFs
cp -r "$downloads"/EOF static_data/EOF

# download correlation radious. Not needed with current namelist: var_3d_nml
# cp -r "$downloads"/chl_rad_corr.nc .


# create launcher.sh
echo . "$dir_3dvar"/machine_module.sh > launcher.sh
echo ./var_3d >> launcher.sh
#echo mpiexec -n 16 ./var_3d >> launcher.sh

