# LIARA-SHCA

[![GitHub](https://img.shields.io/github/license/FlorentinTh/LIARA-SHCA?style=flat-square)](https://github.com/FlorentinTh/LIARA-SHCA/blob/master/LICENSE) [![Last Commit](https://img.shields.io/github/last-commit/FlorentinTh/LIARA-SHCA?style=flat-square)](https://github.com/FlorentinTh/LIARA-SHCA/commits/master)

**Main repository of the LIARA Smart Home Cluster Architecture (SHCA).**

![cluster-network.png](docs/img/architecture.jpg "Cluster Network")

## Authors

* [**Florentin Thullier**](https://github.com/FlorentinTh) - 2019

## Related Paper

Thullier, F., Hallé, S. & Gaboury, S. LE2ML: a microservices-based machine learning workbench as part of an agnostic, reliable and scalable architecture for smart homes. Journal of Ambient Intelligence and Humanized Computing (2021). DOI: 10.1007/s12652-021-03528-8

[![Springer](https://img.shields.io/badge/Springer-link-blue?style=flat-square)](https://link.springer.com/article/10.1007/s12652-021-03528-8)


## Prerequisites

- Download the latest _FlOS_ operating system image :

  [![FlOS](https://img.shields.io/github/release/FlorentinTh/FlOS?style=flat-square)](https://github.com/FlorentinTh/FlOS/releases)

- Flash your image on the SD card with the latest version of _balena Etcher_ :

  [![Etcher](https://img.shields.io/github/release/balena-io/etcher?style=flat-square)](https://github.com/balena-io/etcher/releases)

## Documentation

### Table of Contents

* [1. HA NFS](docs/11-ha-nfs.md)
  * [1.1. Prerequisites](docs/11-ha-nfs.md#1-prerequisites)
  * [1.2. DRBD](docs/11-ha-nfs.md#2-install-and-configure-drbd)
  * [1.3. NFS Server](docs/11-ha-nfs.md#3-install-and-configure-nfs)
  * [1.4. Heartbeat](docs/11-ha-nfs.md#4-install-and-configure-heartbeat)
  * [1.5. NFS Information Mirroring](docs/11-ha-nfs.md#5-configure-nfs-information-mirroring)

* [2. Cluster](docs/00-cluster.md)
  * [2.1. Prerequisites](docs/00-cluster.md#1-prerequisites)
  * [2.2. Create the Cluster](docs/00-cluster.md#1-create-the-cluster)
  * [2.3. Reverse Proxy](docs/00-cluster.md#2-reverse-proxy)
  * [2.4. Cluster Management GUI](docs/00-cluster.md#3-cluster-management-gUI)
  * [2.5. Private Registry](docs/00-cluster.md#4-private-registry)

* [3. Databases](docs/20-databases.md)
  * [3.1. NoSQL - MongoDB](docs/20-databases.md#2-configure-mongodb-replica-set)

### Annexes

* [1. Annex A. - SSL Certificates](docs/80-certificates.md)
* [2. Annex B. - Disk Management](docs/90-disk-management.md)

## Related Repositories

* [**FlOS**](https://github.com/FlorentinTh/FlOS)
  > Repository of the operating system installed on every Raspberry Pi.

## Related Projects

* [**LE2ML**](https://github.com/FlorentinTh/LE2ML)
  > Repository of the LE2ML workbench.

## License

This project is licensed under the Apache-2.0 License - see the [LICENSE](LICENSE) file for details.
