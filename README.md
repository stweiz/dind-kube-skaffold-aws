# Docker in Docker with kubectl and Skaffold

The base of this image is [dind](https://hub.docker.com/_/docker).
While build time there is additional software installed and available in runtime:

- [git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup): Needed as dependency.
- [gettext](https://www.gnu.org/software/gettext/): Needed as dependency.
- [glibc](https://www.gnu.org/software/libc/): Needed as dependency.
- [kubectl](https://kubernetes.io/docs/reference/kubectl/): For Kubernetes deployment with or without Skaffold.
- [skaffold](https://skaffold.dev/docs/references/cli/): For Kubernetes deployment.
- [aws-cli v2](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-commandstructure.html): For logging in in ECR, fetching a Kubernetes context etc.

## Tags

To support [all current Kubernetes versions](https://kubernetes.io/releases/), multiple kubectl versions are needed.
To provide them, multiple Docker images are built with different tags.

- Kubernetes 1.24: dind-kube-skaffold-aws:${version}-1.24
- Kubernetes 1.25: dind-kube-skaffold-aws:${version}-1.25
- Kubernetes 1.26: dind-kube-skaffold-aws:${version}-1.26
- Kubernetes 1.27: dind-kube-skaffold-aws:${version}-1.27
- Kubernetes 1.28: dind-kube-skaffold-aws:${version}-1.28
- Kubernetes 1.29: dind-kube-skaffold-aws:${version}-1.29
- Kubernetes 1.30: dind-kube-skaffold-aws:${version}-1.30 or dind-kube-skaffold-aws:latest
