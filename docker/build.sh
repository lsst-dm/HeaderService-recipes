export LSSTTS_SALOBJ_VERSION=5.17.0
export LSSTTS_XML_VERSION=6.1.0
export LSSTTS_SALIDL_VERSION=1.3.2
export HEADERSERVICE_VERSION=2.3.3
export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}

docker build . -t lsstts/headerservice:$TAG \
       --build-arg LSSTTS_SALIDL_VERSION \
       --build-arg LSSTTS_SALOBJ_VERSION \
       --build-arg LSSTTS_XML_VERSION \
       --build-arg LSSTTS_SAL_VERSION \
       --build-arg HEADERSERVICE_VERSION \
       --build-arg DDS_DOMAIN
