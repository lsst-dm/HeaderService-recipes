export LSSTTS_SALOBJ_VERSION=5.0.0
export LSSTTS_XML_VERSION=4.6.0
export HEADERSERVICE_VERSION=1.4.0
export DDS_DOMAIN=auxtelpath
export TAG=v${HEADERSERVICE_VERSION}_salobj_v${LSSTTS_SALOBJ_VERSION}_xml_v${LSSTTS_XML_VERSION}

docker build . -t lsstts/at_headerservice:$TAG --build-arg LSSTTS_SALOBJ_VERSION --build-arg LSSTTS_XML_VERSION --build-arg HEADERSERVICE_VERSION --build-arg DDS_DOMAIN