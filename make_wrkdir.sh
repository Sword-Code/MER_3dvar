#! /bin/bash

wrkdir=$PWD/wrkdir
dir_3dvar=$PWD/3DVar

mkdir -p "$wrkdir"/DA__FREQ_1

cd $wrkdir
ln -sf "$dir_3dvar"/var_3d .

cp ../files_wrkdir/var_3d_nml .
cp ../files_wrkdir/DA__FREQ_1/satfloat.20150101-00:00:00.nml DA__FREQ_1





echo . "$dir_3dvar"/machine_module.sh > launcher.sh
echo ./var_3d >> launcher.sh
#echo mpiexec -n 16 ./var_3d >> launcher.sh

