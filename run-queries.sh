#!/bin/bash

copy_only="no"
run_query="no"
mysql_cont_ID=`docker ps --filter name=mysql-ut-proj --filter status=running --latest | tail -n 1 | cut -d' ' -f1`
sql_dir="files"


usage() {
cat <<EOF
Usage : $0 [--copy-only] [-q|--run-query]
This script is designed to run queries

Options:
    -h, --help                  show help page and exit
    -q, --run-query FILENAME    run query with this FILENAME in docker container
    --copy-only                 just copy sql scripts to docker container (prepare)

Example:    ./$0 --copy-only
            ./$0 --run-query "1-create-db.sql"
EOF
}

parse_options() {
    SHORT=q:,h
    LONG=run-query:,copy-only,help
    OPTS=$(getopt -a -n run-queries --options $SHORT --longoptions $LONG -- "$@")

    eval set -- "$OPTS"

    while :
    do
    case "$1" in
        -q | --run-query )
            run_query="yes"
            query_name="$2"
            shift 2
            ;;
        --copy-only )
            copy_only="yes"
            # do smth
            shift
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        --)
            shift;
            break
            ;;
        *)
            echo "Unexpected option: $1"
            usage
            ;;
    esac
    done
}

copy_queries_if_needed() {
    is_copied=`docker exec $mysql_cont_ID sh -c "cd root && ls"`
    if [ -z "$is_copied" ]; then
        echo "content is still not copied"
        docker cp $sql_dir $mysql_cont_ID:/root/
    else
        echo "content is already copied"
    fi
}

prepare_credentials() {
    is_copied=`docker exec a44 sh -c "cd root && ls -a .my.cnf"`
    if [ -n "$is_copied" ]; then
        echo "credentials are already copied"
        return
    fi

    tmp_f=`mktemp /tmp/data.XXXXX`

    cat > $tmp_f <<EOF
[mysql]
user=root
password=rootpass
EOF

    docker cp $tmp_f $mysql_cont_ID:/root/.my.cnf
    rm $tmp_f
}



# start of execution
clear
parse_options $@


copy_queries_if_needed
if [ "$copy_only" == "yes" ]; then
    # for manual work
    echo "mysql container ID: $mysql_cont_ID"
    exit 0
fi

prepare_credentials

echo
docker exec -t $mysql_cont_ID  sh -c "mysql -u root < /root/$sql_dir/$query_name"
