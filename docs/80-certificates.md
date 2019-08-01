# Annex A. - Certificates

## Private Certificates

```bash
$ openssl genrsa -out <name>.key 2048

$ openssl ecparam -genkey -name secp384r1 -out <name>.key

$ openssl req -new -x509 -sha256 \
    -key <name>.key -out <name>.crt -days 3650
```

## Public Certificates

* Install required packages :

```bash
$ sudo apt-get install -y dirmngr
```

* Add backports repository to the sources :

```bash
$ echo 'deb http://httpredir.debian.org/debian \
    stretch-backports main contrib non-free' | \
    sudo tee -a /etc/apt/sources.list.d/debian-backports.list
```

* Add the Debian package signing keys :

```bash
$ sudo apt-key adv --keyserver keyserver.ubuntu.com \
    --recv-keys E0B11894F66AEC98
$ sudo apt-key adv --keyserver keyserver.ubuntu.com \
    --recv-keys 7638D0442B90D010
$ sudo apt-key adv --keyserver keyserver.ubuntu.com \
    --recv-keys 8B48AD6246925553
```

* Update package lists :

```bash
$ sudo apt-get update
```

* Install [Cerbot](https://certbot.eff.org/) :

```bash
$ sudo apt-get install -y certbot -t stretch-backports
```
