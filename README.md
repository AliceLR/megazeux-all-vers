# MegaZeux All Vers

Download every DOS/Windows release of MegaZeux (and its source code, where
applicable) into a single folder.

**NOTE**: You should probably count on this folder taking up at least 1 GB of
disk space, as it will download and extract quite a lot of MegaZeux. It currently
takes up about 450 MB on my machine, but this will grow as more MegaZeux versions
are released.

## Setup

* Open a terminal.
* Use `make -j8` to download and install every MZX version and its source code.
* The source code for each version will be located in [this folder]/source. Note
  that this will *not* install the dependencies or compilers required to build any
  of these versions, and this feature is intended primarily for code inspection of
  older versions.

## To run a version of MegaZeux:

* *OPTIONAL*: Put `source [this folder]/alias` in your MSYS2 .bash_rc file to set
up the MZX version aliases.
* Do one of these to run an MZX version:

a) Use the batch file directly (cmd):	MZX 2.51
b) Use the shell file directly (bash):	./MZX.sh 2.51
c) Use the alias (bash):		251

The alias will be the same as the version number but without any decimal points.
Using the alias version is recommended because the batch version does not
currently allow the ability to pass command line options to port versions of
MegaZeux.

