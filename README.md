# MER_3dvar
This is an installer for the 3D-VAR code. It downloads and compile the 3D-VAR code. It also writes some output files usefull to pre and post processing tasks.

## Installation on CINECA's LEONARDO supercomputer
Download 3D-VAR:
```
bash downloader.sh
```

If needed, make the appropriate changes to `src/da_params.f90` (domain dependent). In particular, `jpk_200` repesents the number of layers corresponding to 200m depth.

Compile (it also populates the outfiles directory):
```
bash builder.sh
```

Prepare working directory (`wrkdir` by default):
```
bash make_wrkdir.sh
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

## Installation notes:
make_wrkdir.sh by default searches for a folder called TEMP, from which it copies the static files to the working directory. Otherwise, no static files are copied.

## Run 3D-Var:
From the working directory:
```
bash launcher.sh
```

