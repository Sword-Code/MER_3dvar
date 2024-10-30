#! /bin/bash

VAR3D_BRANCH=Multivariate


HOME_3dvar=$PWD

cd $HOME_3dvar
git clone git@gitlab.hpc.cineca.it:OGS/3DVar.git
cd 3DVar
git checkout -b $VAR3D_BRANCH origin/$VAR3D_BRANCH
