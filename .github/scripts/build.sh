BRANCH_NAME=${GITHUB_REF#refs/heads/}
HASH=$(git rev-parse --short "$GITHUB_SHA")
TIMESTAMP=$(date --utc +%Y%m%dT%H%M%S)
TAG_NAME="${HASH}_${BRANCH_NAME}_${TIMESTAMP}"
echo ${TAG_NAME}

IMAGE_NAME=ghcr.io/${GITHUB_REPOSITORY_OWNER}/$(basename ${GITHUB_REPOSITORY})

docker buildx build --file webapp/Dockerfile --tag $IMAGE_NAME:latest --tag $IMAGE_NAME:${TAG_NAME} --push webapp