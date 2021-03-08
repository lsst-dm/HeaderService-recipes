ARG LSSTTS_XML_VERSION
ARG LSSTTS_SALOBJ_VERSION
ARG LSSTTS_SALIDL_VERSION
ARG LSSTTS_DEPLOY_VERSION
ARG LSSTTS_DDSCONFIG_VERSION

#FROM lsstts/deploy-env:salobj_v${LSSTTS_SALOBJ_VERSION}_idl_v${LSSTTS_SALIDL_VERSION}_xml_v${LSSTTS_XML_VERSION}
#FROM lsstts/deploy-env:salobj_${LSSTTS_SALOBJ_VERSION}
FROM ts-dockerhub.lsst.org/deploy-env:${LSSTTS_DEPLOY_VERSION}


LABEL name="LSST Header Service" \
    vendor="LSST" \
    license="GPLv3"

# Install the OSPL configuration
ARG LSSTTS_DDSCONFIG_VERSION
RUN mkdir -p /opt/lsst && \
    cd /opt/lsst && \
    git clone https://github.com/lsst-ts/ts_ddsconfig --branch ${LSSTTS_DDSCONFIG_VERSION}
ENV OSPL_URI file:///opt/lsst/ts_ddsconfig/config/ospl-shmem.xml

#ARG HEADERSERVICE_VERSION
#RUN source /opt/lsst/software/stack/miniconda/bin/activate && \
#    conda install headerservice=$HEADERSERVICE_VERSION -c conda-forge -c lsstts
#ENV USER=`whoami`

ARG DDS_DOMAIN
ENV LSST_DDS_DOMAIN=${DDS_DOMAIN}

# Extra utils init files
#RUN echo "source /opt/lsst/software/stack/miniconda/bin/activate" > $HOME/setup_HeaderService.env && \
#    echo "source ${HOME}/.ospl_env.sh" >> $HOME/setup_HeaderService.env && \
#    echo "source \$OSPL_HOME/release.com" >> $HOME/setup_HeaderService.env && \
#    echo "export OSPL_URI=file:///opt/lsst/ts_ddsconfig/config/ospl-shmem.xml" >> $HOME/setup_HeaderService.env && \
#    echo "source \$CONDA_PREFIX/HeaderService/setpath.sh \$CONDA_PREFIX/HeaderService" >> $HOME/setup_HeaderService.env
#   echo "export LSST_DDS_DOMAIN=$LSST_DDS_DOMAIN" >> $HOME/setup_HeaderService.env

# The Startup script in lieu of CMD/ENTRYPOINT
#RUN echo "source $HOME/setup_HeaderService.env" > $HOME/start_ATHeaderService.sh && \
#    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/atTelemetry.yaml" >> $HOME/start_ATHeaderService.sh

#RUN echo "source $HOME/setup_HeaderService.env" > $HOME/start_CCHeaderService.sh && \
#    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/ccTelemetry.yaml" >> $HOME/start_CCHeaderService.sh

# The new .startup file
#COPY startup.sh /home/saluser/.startup.sh
#USER root
#RUN chown saluser:saluser /home/saluser/.startup.sh && \
#    chmod a+x /home/saluser/.startup.sh
#USER saluser
