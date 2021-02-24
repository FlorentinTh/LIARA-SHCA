# Databases
## 1. Configure MongoDB Replica Set

- Run the following command :

```bash
$> docker exec -it db_mongo-srv0_1 mongo -u "root" --authenticationDatabase "admin" -p

# The shell is know waiting for your password
```

- Create a configuration variable :

```json
config={
  "_id":"rs0",
  "members":[
    {"_id":0"host":"mongo-srv0:27017"},
    {"_id":1,"host":"mongo-srv1:27017"},
    {"_id":2,"host":"mongo-srv2:27017"}
  ]
}
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