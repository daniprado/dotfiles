#!/bin/bash

GCLOUD_VERSION="372.0.0"
GCLOUD_PKG="google-cloud-sdk"
GCLOUD_FILE="${GCLOUD_PKG}-${GCLOUD_VERSION}-linux-x86_64.tar.gz"
GCLOUD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GCLOUD_FILE}"
GCLOUD_HOME="${AG_SHARE}/${GCLOUD_PKG}"

AWS_FILE="awscli-exe-linux-x86_64.zip"
AWS_URL="https://awscli.amazonaws.com/${AWS_FILE}"

pkg_install "sops"
pipx_install "azure-cli"
pipx_install "aiven-client"

(cd ${AG_TEMP} && \
  curl -LO ${GCLOUD_URL} && \
  tar xzvf ${GCLOUD_FILE} && \
  mv ${GCLOUD_PKG} ${GCLOUD_HOME}) && \
(cd ${GCLOUD_HOME} && \
  ./install.sh \
    --usage-reporting false \
    --command-completion false \
    --path-update false \
    --additional-components docker-credential-gcr kubectl\
    --quiet)

(cd ${AG_TEMP} && \
  curl -LO ${AWS_URL} && \
  unzip -q ${AWS_FILE} && \
  ./aws/install \
    --install-dir ${AG_SHARE}/aws-cli \
    --bin-dir ${AG_BIN})

exit 0
