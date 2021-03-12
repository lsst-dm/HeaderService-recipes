export LSSTTS_SALOBJ_VERSION=6.3.0
export LSSTTS_XML_VERSION=8.0.0
export LSSTTS_SALIDL_VERSION=3.1.1
export LSSTTS_DDSCONFIG_VERSION=v0.5.1
export HEADERSERVICE_VERSION=2.9.0
export LSSTTS_DEPLOY_VERSION=c0018
export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}

docker login ts-dockerhub.lsst.org

docker build . -t ts-dockerhub.lsst.org/headerservice:ts-$TAG \
       --build-arg LSSTTS_SALIDL_VERSION \
       --build-arg LSSTTS_SALOBJ_VERSION \
       --build-arg LSSTTS_XML_VERSION \
       --build-arg LSSTTS_DEPLOY_VERSION\
       --build-arg LSSTTS_DDSCONFIG_VERSION\
       --build-arg HEADERSERVICE_VERSION \
       --build-arg DDS_DOMAIN
