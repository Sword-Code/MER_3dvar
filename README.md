# MER_3dvar
This is an installer for the 3D-VAR code. It downloads and compile the 3D-VAR code. It also writes some output files usefull to pre and post processing tasks.

## Fast installation on CINECA's LEONARDO supercomputer
Download 3D-VAR:
```
bash downloader.sh
```

Compile (it also populates the outfiles directory):
```
bash builder.sh
```

Prepare working directory (`wrkdir` by default):
```
bash builder.sh
```

Done.

## Installation on CINECA's G100 supercomputer
Modify the MACHINE variable in the `builder.sh` file:
```
ARCH=x86_64
OS=LINUX
COMPILER=intel
MACHINE=g100
```

Then proceede as for LEONARDO installation.

## Other systems:
The `builder.sh` file should be modified according to your machine.

## Notes:
To change 3D-VAR configuration parameters, make the appropriate changes to `src/da_params.f90`.
