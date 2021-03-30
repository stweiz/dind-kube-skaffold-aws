#!/bin/sh

version=5

docker build -t bausparkadse/dind-kube-skaffold-aws:${version} .
docker tag bausparkadse/dind-kube-skaffold-aws:${version} bausparkadse/dind-kube-skaffold-aws:latest
docker push bausparkadse/dind-kube-skaffold-aws:${version}
docker push bausparkadse/dind-kube-skaffold-aws:latest
