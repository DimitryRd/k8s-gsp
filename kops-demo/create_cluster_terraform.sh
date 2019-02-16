#!/bin/bash

NAME=demo.k8s.local
KOPS_ARGS=${KOPS_ARGS:-}
KOPS_STATE_STORE=gs://${KOPS_GS:-kops-gcp-demo}
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
  --topology=private \
  --dns private \
  --networking=flannel \
  --network-cidr=${CIDR} \
  --state=${KOPS_STATE_STORE} \
  --ssh-public-key=~/.ssh/k8s-demo/k8demo.pub \
  --project=${PROJECT} \
  --out=. \
  --target=terraform \
  ${KOPS_ARGS}


