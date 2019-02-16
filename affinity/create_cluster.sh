#!/bin/bash

gcloud container clusters create "kube" --zone "europe-west1-d" \
   --machine-type "custom-1-1024" --image-type "GCI" --disk-size "100" \
   --network "default" --enable-cloud-logging \
   --enable-cloud-monitoring \
   --num-nodes="2" --enable-autoscaling --min-nodes="2" --max-nodes="10"

gcloud container clusters get-credentials kube --zone=europe-west1-d --project=extreme-signer-231907
