ARG LSSTTS_XML_VERSION
ARG LSSTTS_SALOBJ_VERSION
ARG LSSTTS_SALIDL_VERSION
ARG LSSTTS_DEPLOY_VERSION

#FROM lsstts/deploy-env:salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}
#FROM lsstts/deploy-env:salobj_${LSSTTS_SALOBJ_VERSION}
FROM ts-dockerhub.lsst.org/deploy-env:${LSSTTS_DEPLOY_VERSION}


LABEL name="LSST Header Service" \
    vendor="LSST" \
    license="GPLv3"

ARG HEADERSERVICE_VERSION
RUN source /opt/lsst/software/stack/miniconda/bin/activate && \
    conda install headerservice=$HEADERSERVICE_VERSION -c conda-forge -c lsstts
ENV USER=`whoami`

ARG DDS_DOMAIN
ENV LSST_DDS_DOMAIN=${DDS_DOMAIN}

# Add to the init file
RUN echo "source /opt/lsst/software/stack/miniconda/bin/activate" > $HOME/setup_HeaderService.env && \
    echo "source \$OSPL_HOME/release.com" >> $HOME/setup_HeaderService.env && \
    echo "source \$CONDA_PREFIX/HeaderService/setpath.sh \$CONDA_PREFIX/HeaderService" >> $HOME/setup_HeaderService.env
#   echo "export LSST_DDS_DOMAIN=$LSST_DDS_DOMAIN" >> $HOME/setup_HeaderService.env

# The Startup script in lieu of CMD/ENTRYPOINT
RUN echo "source $HOME/setup_HeaderService.env" > $HOME/start_HeaderService.sh && \
    echo "ATHS_salobj -c \$HEADERSERVICE_DIR/etc/conf/atTelemetry.yaml --send_efd_message" >> $HOME/start_HeaderService.sh
