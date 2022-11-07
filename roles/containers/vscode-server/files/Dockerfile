ARG DISTRO=ubuntu
ARG VARIANT=jammy

FROM ${DISTRO}:${VARIANT}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

ARG VSCODE_ARCH=x86_64
ARG VSCODE_PATH=/usr/local/bin/code-server
ARG VSCODE_TARGET=unknown-linux-gnu

RUN apt-get update \
 && apt-get install --no-install-recommends -y ca-certificates curl \
 && groupadd -g ${USER_GID} ${USERNAME} \
 && useradd -ms /bin/bash -g ${USER_GID} -u ${USER_UID} ${USERNAME} \
 && curl -sSL https://aka.ms/vscode-server-launcher/${VSCODE_ARCH}-${VSCODE_TARGET} -o ${VSCODE_PATH} \
 && chown ${USERNAME} ${VSCODE_PATH} \
 && chmod +x ${VSCODE_PATH} \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["code-server"]
