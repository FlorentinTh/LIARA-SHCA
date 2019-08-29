# PiCluster

[![GitHub release](https://img.shields.io/github/release/FlorentinTh/PiCluster.svg?style=flat-square)](https://github.com/FlorentinTh/PiCluster/releases) [![GitHub](https://img.shields.io/github/license/FlorentinTh/PiCluster.svg?style=flat-square)](https://github.com/FlorentinTh/PiCluster/blob/master/LICENSE) [![Last Commit](https://img.shields.io/github/last-commit/FlorentinTh/PiCluster?style=flat-square)](https://github.com/FlorentinTh/PiCluster/commits/master)

This repository is the main entry point of resources for the Raspberry Pi cluster architecture for smart homes that was deployed as part of one of my Ph. D. thesis projects.

![cluster-network.png](docs/img/cluster-network.png "Cluster Network")

## Authors

* [**Florentin Thullier**](https://github.com/FlorentinTh) - 2019

## Prerequisites

Download the latest FlOS operating system image [here](https://github.com/FlorentinTh/FlOS/releases).

Flash your image on the SD card with the latest version of [Etcher](https://www.balena.io/etcher/) with the following parameters :

![Etcher Settings](docs/img/etcher-settings.png "Etcher Settings")

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
  * [3.1. SQL - MariaDB](docs/20-databases.md#1-configure-mariadb-multi-master-replication)
  * [3.2. NoSQL - MongoDB](docs/20-databases.md#2-configure-mongodb-replica-set)

### Annexes

* [1. Annex A. - SSL Certificates](docs/80-certificates.md)
* [2. Annex B. - Disk Management](docs/90-disk-management.md)

## Related Repositories

* [**FlOS**](https://github.com/FlorentinTh/FlOS)
  > Repository of the operating system installed on every Raspberry Pi of the cluster.

* [**PiCluster-GUI**](https://github.com/FlorentinTh/PiCluster-GUI)
  > Repository of the GUI to interact with the Raspberry Pi cluster.

* [**PiCluster-Auth**](https://github.com/FlorentinTh/PiCluster-Auth)
  > Repository of an authentication module employed in the cluster.

* [**PiCluster-FeatureExtractor**](https://github.com/FlorentinTh/PiCluster-FeatureExtractor)
  > Repository of a feature extractor module employed in the cluster.

## License

This project is licensed under the Apache-2.0 License - see the [LICENSE](LICENSE) file for details.
