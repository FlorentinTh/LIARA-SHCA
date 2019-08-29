CREATE USER 'replication'@'172.20.0.12' IDENTIFIED BY '<your_password>';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'172.20.0.12';
