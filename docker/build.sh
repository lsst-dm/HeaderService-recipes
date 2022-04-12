export LSSTTS_DDSCONFIG_VERSION=v0.9.0
export HEADERSERVICE_VERSION=3.0.0
export LSSTTS_DEPLOY_VERSION=c0025
#export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}_${LSSTTS_DEPLOY_VERSION}
export TAG=v${HEADERSERVICE_VERSION}_${LSSTTS_DEPLOY_VERSION}

docker login ts-dockerhub.lsst.org

docker build . -t ts-dockerhub.lsst.org/headerservice:ts-$TAG \
       --no-cache \
       --build-arg LSSTTS_DEPLOY_VERSION\
       --build-arg LSSTTS_DDSCONFIG_VERSION\
       --build-arg HEADERSERVICE_VERSION
echo "Execute:"
echo "   docker push ts-dockerhub.lsst.org/headerservice:ts-$TAG"
