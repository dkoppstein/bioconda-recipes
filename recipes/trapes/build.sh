#!/bin/bash

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/share/trapes_data

sed "s/#!\/ bin\/env\/#!\/usr\/bin\/env python/g" trapes.py | \ # until https://github.com/YosefLab/TRAPeS/issues/4 fixed
sed "s/Data/..\/share\/trapes_data/g" | \ # switch `pwd`/Data to ../share/trapes_data
> $PREFIX/bin/trapes.py

cp -f vdj.alignment $PREFIX/bin/

cp -rf Data/* $PREFIX/share/trapes_data/
chmod +x $PREFIX/bin/trapes.py $PREFIX/bin/vdj.alignment

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
