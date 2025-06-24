#! /bin/env bash
SCRIPT_VERSION="1.0.0"
# CONFIG
IMAGE_REGISTRY="ghcr.io"
IMAGE_NAME="jekotia/github-pages"
TAG_BASE="chirpy-"
# END CONFIG

SCRIPT_PATH=$(dirname "$(realpath "$0" || exit 1)" || exit 1)
PROJECT_PATH="$(realpath "$SCRIPT_PATH/../")"
VERSION=$(grep "ENV VERSION=" "${PROJECT_PATH}/Dockerfile" | cut -d '"' -f 2)
IMAGE_ID="${IMAGE_REGISTRY}/${IMAGE_NAME}"
VERSION_TAG="${TAG_BASE}v${VERSION}"
LATEST_TAG="${TAG_BASE}latest"
TESTING_TAG="${TAG_BASE}test-${VERSION}"

case $1 in
    build)
        cd "${PROJECT_PATH}" || exit 1
        docker \
            buildx \
            build \
            . \
            --tag "${IMAGE_ID}:${TESTING_TAG}"
    ;;
    test)
        cd "${PROJECT_PATH}" || exit 1
        echo "Deploying container with image '${IMAGE_ID}:${TESTING_TAG}'"
        docker \
            run \
            --rm \
            -v "${PROJECT_PATH}":/src/site \
            -p 4000:4000 \
            --pull never \
            "${IMAGE_ID}:${TESTING_TAG}"
    ;;
    push)
        echo -e "You are about to push the image to ${IMAGE_ID} with tags:"
        echo -e " - ${LATEST_TAG}"
        echo -e " - ${VERSION_TAG}"
        read -p "Are you sure you wish to continue? [y/N] " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]] ; then
            echo "Re-naming/tagging testing images in preparation to push..."
            docker image tag "${IMAGE_ID}:${TESTING_TAG}" "${IMAGE_ID}:${LATEST_TAG}" || exit 1
            docker image tag "${IMAGE_ID}:${TESTING_TAG}" "${IMAGE_ID}:${VERSION_TAG}" || exit 1
            echo
            docker push "${IMAGE_ID}:${LATEST_TAG}"
            docker push "${IMAGE_ID}:${VERSION_TAG}"
        fi
    ;;
    version)
        echo "Script version ${SCRIPT_VERSION}, by Josh 'Jekotia' Ameli."
        echo "Written for and tested under the bash shell."
        echo
        echo "Currently building image for v${VERSION} of Chirpy."
        echo "Gemfile sourced from https://github.com/cotes2020/chirpy-starter/tree/v${VERSION}"
    ;;
    *)
        echo 
        echo "Usage:  $0 COMMAND"
        echo "Simple script for consistent handling of docker images, used for testing Chirpy-"
        echo "based GitHub Pages sites. Extracts the VERSION value from the project Dockerfile"
        echo
        echo "Image name:      ${IMAGE_ID}"
        echo "Testing tag:     ${TESTING_TAG}"
        echo "Production tags: ${LATEST_TAG}"
        echo "                 ${TAG_BASE}vVERSION (v${VERSION})"
        echo 
        echo "Commands:"
        echo "  build     Use docker buildx to build the image with the testing tag"
        echo "  test      Starts a container using the testing-tagged image on port 4000,"
        echo "            mounting the project directory as the site directory"
        echo "  push      Pushes the image with the production tags"
        echo "  version   Prints version information"
    ;;
esac

exit $?