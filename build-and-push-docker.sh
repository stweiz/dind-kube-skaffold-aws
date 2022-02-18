#!/bin/sh

version=10

docker build --pull -t bausparkadse/dind-kube-skaffold-aws:${version} . && \
docker tag bausparkadse/dind-kube-skaffold-aws:${version} bausparkadse/dind-kube-skaffold-aws:latest && \
docker push bausparkadse/dind-kube-skaffold-aws:${version} && \
docker push bausparkadse/dind-kube-skaffold-aws:latest
