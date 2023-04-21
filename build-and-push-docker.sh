#!/bin/bash

if [[ ! -f version ]]; then
    echo -n 0 > version
fi

version=$(cat version)
version=$((version+1))

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} -f Dockerfile.1.24 . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version}-1.24

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} -f Dockerfile.1.25 . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version}-1.25

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} -f Dockerfile.1.26 . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version}-1.26

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} -f Dockerfile.1.27 . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version}-1.27 bausparkadse/dind-kube-skaffold-aws:latest && \
docker push bausparkadse/dind-kube-skaffold-aws:${version}-1.24 && \
docker push bausparkadse/dind-kube-skaffold-aws:${version}-1.25 && \
docker push bausparkadse/dind-kube-skaffold-aws:${version}-1.26 && \
docker push bausparkadse/dind-kube-skaffold-aws:${version}-1.27 && \
docker push bausparkadse/dind-kube-skaffold-aws:latest

echo -n ${version} > version

git add version
git commit -m "Makes new Docker image available"
git push
