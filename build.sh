#!/bin/bash
export PRODUCT_VERSION=12.0.4.0
export PRODUCT_LABEL=ace-${PRODUCT_VERSION}
export DOWNLOAD_URL=http://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/integration/12.0.4.0-ACE-LINUX64-DEVELOPER.tar.gz

# Exit on error
set -e


cd ace-basic
docker build --build-arg DOWNLOAD_URL --build-arg PRODUCT_LABEL -t ace-basic:${PRODUCT_VERSION}-ubuntu -f Dockerfile.ubuntu .

docker run -e LICENSE=accept --rm -ti ace-basic:12.0.4.0-ubuntu
