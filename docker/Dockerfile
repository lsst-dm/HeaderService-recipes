ARG LSSTTS_XML_VERSION
ARG LSSTTS_SALOBJ_VERSION
ARG LSSTTS_SALIDL_VERSION

#FROM lsstts/deploy-env:salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}
FROM lsstts/deploy-env:salobj_${LSSTTS_SALOBJ_VERSION}


LABEL name="LSST AuxTel Header Service Development Environment" \
    vendor="LSST" \
    license="GPLv3"

ARG HEADERSERVICE_VERSION
RUN source $HOME/miniconda3/bin/activate && \
    conda install headerservice=$HEADERSERVICE_VERSION -c conda-forge -c lsstts
ENV USER=`whoami`

ARG DDS_DOMAIN
ENV LSST_DDS_DOMAIN=${DDS_DOMAIN}

# Add to the init file
RUN echo "source ~/miniconda3/bin/activate" > $HOME/setup_HeaderService.env && \
    echo "source \$OSPL_HOME/release.com" >> $HOME/setup_HeaderService.env && \
    echo "source \$CONDA_PREFIX/HeaderService/setpath.sh \$CONDA_PREFIX/HeaderService" >> $HOME/setup_HeaderService.env
#   echo "export LSST_DDS_DOMAIN=$LSST_DDS_DOMAIN" >> $HOME/setup_HeaderService.env

# The AuxTel Startup script in lieu of CMD/ENTRYPOINT
RUN cat $HOME/setup_HeaderService.env > $HOME/start_ATHeaderService.sh && \
    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/atTelemetry.yaml" >> $HOME/start_ATHeaderService.sh

# The ComCam Startup script in lieu of CMD/ENTRYPOINT
RUN cat $HOME/setup_HeaderService.env > $HOME/start_CCHeaderService.sh && \
    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/ccTelemetry.yaml" >> $HOME/start_CCHeaderService.sh
