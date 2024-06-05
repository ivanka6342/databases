#!/bin/bash

# docker-compose up -d

# how to run: ./run-queries.sh "1-create-db.sql"

QUERY=$1

mysql_cont_ID=`docker ps --filter name=mysql-ut-proj --filter status=running --latest | tail -n 1 | cut -d' ' -f1`
docker cp files $mysql_cont_ID:/root/

tmp_f=`mktemp /tmp/data.XXXXX`

cat > $tmp_f <<EOF
[mysql]
user=root
password=rootpass
EOF

docker cp $tmp_f $mysql_cont_ID:/root/.my.cnf
rm $tmp_f


docker exec -t $mysql_cont_ID "bash -c 'mysql -u root < /root/files/$QUERY'"
