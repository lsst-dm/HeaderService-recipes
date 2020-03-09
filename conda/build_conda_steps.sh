export HEADERSERVICE_VERSION=1.4.1
export LSSTTS_SALOBJ_VERSION=v5.4.0
conda-build . -c conda-forge -c lsstts
