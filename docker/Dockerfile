ARG LSSTTS_DEPLOY_VERSION
ARG LSSTTS_DDSCONFIG_VERSION

FROM ts-dockerhub.lsst.org/deploy-env:${LSSTTS_DEPLOY_VERSION}


LABEL name="LSST Header Service" \
    vendor="LSST" \
    license="GPLv3"

# Not needed now, comes with deploy container
# Install the OSPL configuration
#ARG LSSTTS_DDSCONFIG_VERSION
#RUN mkdir -p /opt/lsst && \
#    cd /opt/lsst && \
#    git clone https://github.com/lsst-ts/ts_ddsconfig --branch ${LSSTTS_DDSCONFIG_VERSION}
#ENV OSPL_URI file:///opt/lsst/ts_ddsconfig/config/ospl-shmem.xml

# Pre-reqs for HeaderService
ARG MINICONDA_PATH=/opt/lsst/software/stack/miniconda
RUN source ${MINICONDA_PATH}/bin/activate \
    && conda install -y fitsio pyyaml \
    # Need to downgrade to setuptools=59.8.0
    && conda install -y setuptools=59.8.0

ARG HEADERSERVICE_VERSION
RUN source ${MINICONDA_PATH}/bin/activate && \
    mkdir -p /tmp/repos && \
    cd /tmp/repos && \
    git clone https://github.com/lsst-dm/HeaderService -b ${HEADERSERVICE_VERSION} && \
    cd HeaderService && \
    export PYTHONPATH=$PYTHONPATH:$CONDA_PREFIX/HeaderService/python &&\
    python setup.py install --prefix=$CONDA_PREFIX/HeaderService --install-lib=$CONDA_PREFIX/HeaderService/python --install-data $CONDA_PREFIX/HeaderService

ENV USER=`whoami`

# Extra utils init files
RUN echo "source /opt/lsst/software/stack/miniconda/bin/activate" > $HOME/setup_HeaderService.env && \
    echo "source ${HOME}/.ospl_env.sh" >> $HOME/setup_HeaderService.env && \
    echo "source \$OSPL_HOME/release.com" >> $HOME/setup_HeaderService.env && \
    echo "export OSPL_URI=file:///opt/lsst/ts_ddsconfig/config/ospl-shmem.xml" >> $HOME/setup_HeaderService.env && \
    echo "source \$CONDA_PREFIX/HeaderService/setpath.sh \$CONDA_PREFIX/HeaderService" >> $HOME/setup_HeaderService.env

# The Startup script in lieu of CMD/ENTRYPOINT
RUN echo "source $HOME/setup_HeaderService.env" > $HOME/start_ATHeaderService.sh && \
    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/atTelemetry.yaml" >> $HOME/start_ATHeaderService.sh

RUN echo "source $HOME/setup_HeaderService.env" > $HOME/start_CCHeaderService.sh && \
    echo "headerservice -c \$HEADERSERVICE_DIR/etc/conf/ccTelemetry.yaml" >> $HOME/start_CCHeaderService.sh

# The new .startup file
COPY startup.sh /home/saluser/.startup.sh

USER root
RUN yum -y install which procps

RUN chown saluser:saluser /home/saluser/.startup.sh && \
    chmod a+x /home/saluser/.startup.sh
USER saluser
