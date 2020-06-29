export LSSTTS_SALOBJ_VERSION=5.15.0
export LSSTTS_XML_VERSION=6.0.0
export LSSTTS_SALIDL_VERSION=1.2.2
export HEADERSERVICE_VERSION=2.3.1
export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}

docker build . -t lsstts/headerservice:$TAG \
       --build-arg LSSTTS_SALIDL_VERSION \
       --build-arg LSSTTS_SALOBJ_VERSION \
       --build-arg LSSTTS_XML_VERSION \
       --build-arg LSSTTS_SAL_VERSION \
       --build-arg HEADERSERVICE_VERSION \
       --build-arg DDS_DOMAIN
