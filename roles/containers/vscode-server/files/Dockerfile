FROM ubuntu:jammy

ARG FEATURE_VERSION=master

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

ARG VSCODE_ARCH=x86_64
ARG VSCODE_PATH=/usr/local/bin/code-server
ARG VSCODE_TARGET=unknown-linux-gnu

ARG CRD2PULUMI_VERSION=1.2.3
ARG DOCKER_COMPOSE_VERSION=2.12.1
ARG DOCKER_VERSION=20.10.20
ARG GO_VERSION=1.19.2
ARG HUGO_VERSION=0.105.0
ARG KUBECTL_VERSION=1.25.3
ARG NODE_VERSION=18.12.0
ARG PHP_COMPOSER_VERSION=2.4.4
ARG PHP_VERSION=8.1.12
ARG PHP_XDEBUG_VERSION=none
ARG PULUMI_VERSION=3.46.1
ARG PYTHON_VERSION=3.10.8
ARG RUST_VERSION=1.65.0

ENV CARGO_HOME=/usr/local/cargo
ENV GOPATH=/opt/go
ENV GOROOT=/usr/local/go
ENV NPM_HOME=/usr/local/npm

ENV PATH=${CARGO_HOME}/bin:${GOROOT}/bin:${GOPATH}/bin:${NPM_HOME}/bin:${PATH}

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends --yes apt-utils ca-certificates curl \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/images/ubuntu/setup.sh)" -- "${USERNAME}" "${USER_UID}" "${USER_GID}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/devtools/install.sh)" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/go/install.sh)" -- "${GO_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/node/install.sh)" -- "${NODE_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/php/install.sh)" -- "${PHP_VERSION}" "${PHP_COMPOSER_VERSION}" "${PHP_XDEBUG_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/python/install.sh)" -- "${PYTHON_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/rust/install.sh)" -- "${RUST_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/docker/install.sh)" -- "${DOCKER_VERSION}" "${DOCKER_COMPOSE_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/kubernetes/install.sh)" -- "${KUBECTL_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/pulumi/install.sh)" -- "${PULUMI_VERSION}" "${CRD2PULUMI_VERSION}" \
 && bash -c "$(curl -fsSL https://raw.githubusercontent.com/progamesigner/devcontainers/${FEATURE_VERSION}/features/hugo/install.sh)" -- "${HUGO_VERSION}" \
 && curl -sSL https://aka.ms/vscode-server-launcher/${VSCODE_ARCH}-${VSCODE_TARGET} -o ${VSCODE_PATH} \
 && chown ${USERNAME} ${VSCODE_PATH} \
 && chmod +x ${VSCODE_PATH} \
 && apt-get autoremove --yes \
 && apt-get clean --yes \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["code-server"]
