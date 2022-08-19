#!/bin/bash

if [[ ! -f version ]]; then
    echo -n 0 > version
fi

version=$(cat version)
version=$((version+1))

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version} bausparkadse/dind-kube-skaffold-aws:latest && \
docker push bausparkadse/dind-kube-skaffold-aws:${version} && \
docker push bausparkadse/dind-kube-skaffold-aws:latest

echo -n ${version} > version

git add version
git commit -m "Makes new Docker image available"
git push
