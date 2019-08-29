# Databases

## 1. Configure MariaDB Multi-Master Replication

- On server1 :

```sql
SHOW MASTER STATUS;
```

- On server2 :

```sql
STOP SLAVE;
CHANGE MASTER TO master_host='172.20.0.13', master_port=3306, master_user='replication',
    master_password='password', master_log_file='mysql-bin.000003', master_log_pos=629;
START SLAVE;

SHOW MASTER STATUS;
```

- On server3 :

```sql
STOP SLAVE;
CHANGE MASTER TO master_host='172.20.0.11', master_port=3306, master_user='replication',
    master_password='password', master_log_file='mysql-bin.000003', master_log_pos=629;
START SLAVE;

SHOW MASTER STATUS;
```

- On server1:

```sql
STOP SLAVE;
CHANGE MASTER TO master_host='172.20.0.12', master_port=3306, master_user='replication',
    master_password='password', master_log_file='mysql-bin.000003', master_log_pos=629;
START SLAVE;

CREATE USER 'haproxy_check'@'%';
```

## 2. Configure MongoDB Replica Set

- Run the following command :

```bash
$ docker exec -it db_mongo-srv0_1 mongo -u "root" --authenticationDatabase "admin" -p

# The shell is know waiting for your password
```

- Create a configuration variable :

```json
config={"_id":"rs0",
  "members":[{"_id":0"host":"mongo-srv0:27017"},
  {"_id":1,"host":"mongo-srv1:27017"},
  {"_id":2,"host":"mongo-srv2:27017"},
  {"_id":3,"host":"mongo-srv3:27017"},
  {"_id":4,"host":"mongo-srv4:27017"}]}
```

- Initialize the Replica Set :

```json
rs.initiate(config)
```

- Create both ```admin``` as well as ```cluster``` users :

```json
db.getSiblingDB("admin").createUser(
  {
    user: "admin",
    pwd: passwordPrompt(),
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

db.getSiblingDB("admin").createUser(
  {
    "user" : "cluster",
    "pwd" : passwordPrompt(),
    roles: [ { "role" : "clusterAdmin", "db" : "admin" } ]
  }
)
```

- Exit the container, your Replica Set is know setup.
