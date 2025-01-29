BRANCH_NAME=${GITHUB_REF#refs/heads/}
HASH=$(git rev-parse --short "$GITHUB_SHA")
#!/bin/bash

BRANCH_NAME=${GITHUB_REF#refs/heads/}
HASH=$(git rev-parse --short "$GITHUB_SHA")
TIMESTAMP=$(date --utc +%Y%m%dT%H%M%S)
TAG_NAME="${HASH}_${BRANCH_NAME}_${TIMESTAMP}"
echo "Generated tag: ${TAG_NAME}"

# Define Docker Hub repository (force lowercase)
IMAGE_NAME="$(echo "${DOCKERHUB_USERNAME}/$(basename "${GITHUB_REPOSITORY}")" | tr '[:upper:]' '[:lower:]')"

echo "Using image name: $IMAGE_NAME"

# Login to Docker Hub
echo "${DOCKERHUB_TOKEN}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

# Build and push the image
docker buildx build --file webapp/Dockerfile --tag "$IMAGE_NAME:latest" --tag "$IMAGE_NAME:$TAG_NAME" --push webapp
