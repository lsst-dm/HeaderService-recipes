export HEADERSERVICE_VERSION=1.2.0
export LSSTTS_SALOBJ_VERSION=v5.0.0
conda-build . -c conda-forge -c lsstts
