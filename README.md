# 3dvar_builder
This is an installer for the 3D-VAR code. It downloads and compile the 3D-VAR code. It also writes some output files usefull to pre and post processing tasks.

## Installation on CINECA's LEONARDO supercomputer
Download 3D-VAR:
```
bash downloader.sh
```

If static files are available, create a folder called `static_files` and put them in it.

Compile (it also populates the outfiles directory):
```
bash builder.sh
```

Prepare working directory (`wrkdir` by default):
```
python make_wrkdir.py
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
`builder.sh` needs a `da_params.f90` file to define 3D-VAR variables and parameters (in particular, `jpk_200` repesents the number of layers corresponding to 200m depth). By default, `builder.sh` looks for the file in the `static_files` folder. If the folder does not exists or it does not contain a `da_params.f90` file, then `src/da_params.f90` is used. A custom file can be used by specifing the absolute path as argument, i.e.:
```
bash builder.sh /absolute/path/to/da_params.f90
```
`make_wrkdir.py` by default searches for a folder called `static_files`, from which it copies the static files to the working directory. Otherwise, no static files are copied.

## Run 3D-Var:
From the working directory:
```
bash launcher.sh
```

