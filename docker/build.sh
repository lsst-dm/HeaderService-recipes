export LSSTTS_DDSCONFIG_VERSION=v0.10.0
export HEADERSERVICE_VERSION=3.1.0
export LSSTTS_DEPLOY_VERSION=c0026
export TAG=v${HEADERSERVICE_VERSION}_${LSSTTS_DEPLOY_VERSION}

docker login ts-dockerhub.lsst.org

docker build . -t ts-dockerhub.lsst.org/headerservice:ts-$TAG \
       --no-cache \
       --build-arg LSSTTS_DEPLOY_VERSION\
       --build-arg LSSTTS_DDSCONFIG_VERSION\
       --build-arg HEADERSERVICE_VERSION
echo "Execute:"
echo "   docker push ts-dockerhub.lsst.org/headerservice:ts-$TAG"
