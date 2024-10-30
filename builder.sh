#! /bin/bash

ARCH=x86_64
OS=LINUX
COMPILER=intel
MACHINE=leonardo

DEBUG_3DVAR=
# DEBUG_3DVAR=.dbg


. compilers/machine_modules/${MACHINE}.${COMPILER}

cd 3DVar
INC_FILE=${ARCH}.${OS}.${COMPILER}${DEBUG_3DVAR}.inc
cp $INC_FILE compiler.inc
make clean
gmake
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi
export DA_INC=$PWD
echo DA_INC= $DA_INC
