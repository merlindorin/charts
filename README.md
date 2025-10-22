Charts
======

[![Release Charts](https://github.com/merlindorin/charts/actions/workflows/release.yml/badge.svg)](https://github.com/merlindorin/charts/actions/workflows/release.yml)
[![Lint and Test Charts](https://github.com/merlindorin/charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/merlindorin/charts/actions/workflows/lint-test.yaml)
[![License](https://img.shields.io/github/license/merlindorin/charts?style=flat-square)](https://github.com/merlindorin/charts/blob/main/LICENCE)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/merlindorin/charts?style=flat-square)](https://github.com/merlindorin/charts/releases)
[![GitHub stars](https://img.shields.io/github/stars/merlindorin/charts?style=flat-square)](https://github.com/merlindorin/charts/stargazers)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/merlindorin&style=flat-square)](https://artifacthub.io/packages/search?repo=merlindorin)

> Helm charts created mainly for personal use or with a pending contribution.

### TL;DR

```shell
helm repo add merlindorin https://merlindorin.github.io/charts
helm search repo merlindorin

# Install any chart you need
helm install my-release merlindorin/<chart>
```

### Chart Available

| Chart Name | Description | Last Version | App Version | Install |
|------------|-------------|:------------:|:-----------:|---------|
| [`pinniped-concierge`](charts/concierge) | A Pinniped concierge helm chart for Kubernetes | 0.1.2 | 0.12.0 | `helm install my-release merlindorin/pinniped-concierge` |
| [`exporter-unifi-protect`](charts/exporter-unifi-protect) | A Prometheus exporter for UniFi Protect monitoring | 0.1.0 | v0.0.8 | `helm install my-release merlindorin/exporter-unifi-protect` |
| [`pinniped`](charts/pinniped) | A Meta Pinniped Helm chart for Kubernetes | 0.1.4 | - | `helm install my-release merlindorin/pinniped` |
| [`pinniped-supervisor`](charts/supervisor) | A Pinniped supervisor helm chart for Kubernetes | 0.1.2 | 0.12.0 | `helm install my-release merlindorin/pinniped-supervisor` |

### Before you begin

#### Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

#### Setup a Kubernetes Cluster

For setting up Kubernetes on other cloud platforms or bare-metal servers refer to the Kubernetes [getting started guide](http://kubernetes.io/docs/getting-started-guides/).

#### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

#### Add Repo

The following command allows you to download and install all the charts from this repository:

```shell
helm repo add merlindorin https://merlindorin.github.io/charts
```

#### Using Helm

Once you have installed the Helm client, you can deploy a merlindorin Helm Chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a
few commands, otherwise the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions
on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:
* View available charts: `helm search repo`
* Install a chart: `helm install my-release merlindorin/<package-name>`
* Upgrade your application: `helm upgrade`

### Development

- Generate `README.md`: `docker run --rm --volume "$(pwd):/data" -u $(id -u) hairyhenderson/gomplate:latest -f /data/README.tmpl > README.md`
- Generate Chart `README.md`: `docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest`

#### Generate `README.md`

If you want to generate your own documentation, you can use the following environment variables:

- `OWNER` (default: "merlindorin"), charts repository owner
- `REPO` (default: "/data"), repository source folder
- `GOMPLATE_VERSION` (default: "latest"), version used for generating `README.md`
- `HELM_DOC_VERSION` (default: "latest"), version used for generating chart `README.md`

For example:

```shell
# Generate README.md for merlindorin in the current folder
OWNER=merlindorin REPO=$(PWD) gomplate -f README.tmpl
```

### References

- Pinniped Project: [https://github.com/vmware-tanzu/pinniped](https://github.com/vmware-tanzu/pinniped)
- Bitnami Charts: [https://github.com/bitnami/charts](https://github.com/bitnami/charts)
