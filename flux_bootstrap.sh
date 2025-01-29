#!/bin/bash

set -e
# export GITHUB_TOKEN="personal-access-token generated from github"
flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --token-auth \
  --owner=Real-Artisan \
  --repository=cadmus \
  --branch=main \
  --path=kubernetes

# kubectl create secret generic dockerhub-creds \
#   --namespace flux-system \
#   --from-literal=DOCKER_USER=realartisan \
#   --from-literal=DOCKER_PASSWORD=<dockerhub_token_generated_from_dockerhub>