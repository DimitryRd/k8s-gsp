#!/bin/bash

NAME=demo.k8s.local
KOPS_ARGS=${KOPS_ARGS:-}
KOPS_STATE_STORE=gs://${KOPS_GS:-extreme-signer-231907-gcp-demo}
KOPS_GS=gs://${KOPS_GS:-extreme-signer-231907-gcp-demo}
KUBERNETES_VERSION=${KUBERNETES_VERSION:-1.10.0}


echo "*** Creating cluster state"
kops create cluster \
  --name=${NAME} \
  --cloud=gce \
  --project=${PROJECT} \
  --kubernetes-version=${KUBERNETES_VERSION} \
  --associate-public-ip=false \
  --state=${KOPS_STATE_STORE} \
  --master-size=n1-standard-1 \
  --node-size=n1-standard-1 \
  --master-zones="europe-west1-d" \
  --zones="europe-west1-d" \
  --vpc $K8S_NETWORK_NAME
  --ssh-public-key=~/.ssh/k8s-demo/k8demo.pub \
  --project=${PROJECT} \
  ${KOPS_ARGS}

