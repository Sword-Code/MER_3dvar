#! /bin/bash

ARCH=x86_64
OS=LINUX
COMPILER=intel
MACHINE=leonardo

DEBUG_3DVAR=
# DEBUG_3DVAR=.dbg

. compilers/machine_modules/${MACHINE}.${COMPILER}

echo compiling 3dvar
cd 3DVar
cp ../compilers/machine_modules/${MACHINE}.${COMPILER} machine_module.sh
INC_FILE=${ARCH}.${OS}.${COMPILER}${DEBUG_3DVAR}.inc
cp $INC_FILE compiler.inc
cp ../src/da_params.f90 .
make clean
gmake
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi

echo preparing DAVars.txt
cd ..
gmake
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi
