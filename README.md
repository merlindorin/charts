Charts
======

![Helm-Doc: 1.5.0](https://img.shields.io/badge/Helm&nbsp;Doc-1.5.0-informational?style=flat-square)

> Helm chart created mainly for personal use or with a pending contribution.

## TL;DR

```shell
helm repo add merlindorin https://merlindorin.github.io/charts
helm search repo merlindorin

# Install any chart you need
helm install my-release merlindorin/<chart>
```

## Chart available

| Chart Name | Description | Last Version | Install |
|------------|-------------|--------------|---------|
| `pinniped` | Pinniped meta chart that regroup supervisor & concierge with ready to use template | `0.1.4` | `helm install my-release merlindorin/pinniped`
| `pinniped-supervisor` | Pinniped Supervisor only chart  | `0.1.2` | `helm install my-release merlindorin/pinniped-supervisor`
| `pinniped-concierge` | Pinniped Concierge only chart  | `0.1.2` | `helm install my-release merlindorin/pinniped-concierge`

## Before you begin

### Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0

### Setup a Kubernetes Cluster

For setting up Kubernetes on other cloud platforms or bare-metal servers refer to the Kubernetes [getting started guide](http://kubernetes.io/docs/getting-started-guides/).

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

### Add Repo

The following command allows you to download and install all the charts from this repository:

```bash
$ helm repo add merlindorin https://merlindorin.github.io/charts
```

### Using Helm

Once you have installed the Helm client, you can deploy a Merlindorin Helm Chart into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a
few commands, otherwise the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions
on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:
* View available charts: `helm search repo`
* Install a chart: `helm install my-release merlindorin/<package-name>`
* Upgrade your application: `helm upgrade`

## Development

- Generate Chart Documentation: `docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest`

## References

- Pinniped Project: [https://github.com/vmware-tanzu/pinniped](https://github.com/vmware-tanzu/pinniped)
- Bitnami Charts: [https://github.com/bitnami/charts](https://github.com/bitnami/charts)
