
# Conda pre-reqs to build
```
conda install conda-build
conda install anaconda
```

# To build locally
```
cd HeaderService-recipes/conda
conda-build -c conda-forge -c lsstts
```

# Install locally for testing before publishing
```
conda install --use-local headerservice -c conda-forge -c lsstts
```

# Upload
```
anaconda --force -u lsstts $HOME/miniconda3/conda-bld/linux-64/headerservice-1.2.0-py37_0.tar.bz2
```

# Build on T&SS docker
```
cd docker
./build.sh
```

# Run inside container
```
docker run -it --rm lsstts/at_headerservice:$TAG

or

docker run -it -rm lsstts/at_headerservice:v1.2.0_salobj_v5.0.0_xml_v4.4.1
```