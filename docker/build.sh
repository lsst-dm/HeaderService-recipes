export LSSTTS_SALOBJ_VERSION=6.4.1
export LSSTTS_XML_VERSION=9.1.1
export LSSTTS_SALIDL_VERSION=3.1.3
export LSSTTS_DDSCONFIG_VERSION=v0.6.2
export HEADERSERVICE_VERSION=2.9.1
export LSSTTS_DEPLOY_VERSION=c0021
export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}_${LSSTTS_DEPLOY_VERSION}

docker login ts-dockerhub.lsst.org

docker build . -t ts-dockerhub.lsst.org/headerservice:ts-$TAG \
       --build-arg LSSTTS_SALIDL_VERSION \
       --build-arg LSSTTS_SALOBJ_VERSION \
       --build-arg LSSTTS_XML_VERSION \
       --build-arg LSSTTS_DEPLOY_VERSION\
       --build-arg LSSTTS_DDSCONFIG_VERSION\
       --build-arg HEADERSERVICE_VERSION \
       --build-arg DDS_DOMAIN
