ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-42}"
ARG NVIDIA_DRIVER_TYPE=""

FROM scratch AS ctx
COPY / /

FROM ghcr.io/ublue-os/akmods-nvidia${NVIDIA_DRIVER_TYPE}:main-${FEDORA_MAJOR_VERSION} AS akmods_nvidia

FROM ghcr.io/ublue-os/silverblue-main:${FEDORA_MAJOR_VERSION}

# Build, cleanup, commit.
RUN --mount=type=bind,from=ctx,src=/,dst=/ctx \ 
    --mount=type=bind,from=akmods_nvidia,src=/rpms,dst=/tmp/akmods-nv-rpms \
    mkdir -p /var/lib/alternatives && \
    AKMODNV_PATH=/tmp/akmods-nv-rpms /ctx/build/nvidia_install.sh \
    /ctx/build/build.sh  && \
    mv /var/lib/alternatives /staged-alternatives && \
    /ctx/build/clean_stage.sh && \
    ostree container commit && \
    mkdir -p /var/lib && mv /staged-alternatives /var/lib/alternatives && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /var/tmp
    
