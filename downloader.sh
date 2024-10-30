#! /bin/bash

VAR3D_RELEASE=Multivariate


HOME_3dvar=$PWD

cd $HOME_3dvar
git clone git@gitlab.hpc.cineca.it:OGS/3DVar.git
cd 3DVar
git checkout -b $VAR3D_RELEASE $VAR3D_RELEASE
