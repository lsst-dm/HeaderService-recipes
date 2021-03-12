export HEADERSERVICE_VERSION=2.9.0
conda-build . -c conda-forge -c lsstts
echo " "
echo "--------------------"
echo "Now Please upload:"
echo " anaconda upload --force -u lsstts $CONDA_PREFIX/conda-bld/linux-64/headerservice-$HEADERSERVICE_VERSION-py38_0.tar.bz2"
echo " "
echo "--------------------"
