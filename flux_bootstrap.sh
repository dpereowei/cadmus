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