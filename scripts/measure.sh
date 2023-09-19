#!/bin/bash
set -eux

cd `dirname $0`

# TODO: settings
MYSQL_USER=root
MYSQL_PASS=root
MYSQL_DBNAME=
GITHUB_TOKEN=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
GITHUB_REPO=

# Clear logs
sudo test -f /var/log/nginx/access.log && sudo sh -c 'echo -n "" > /var/log/nginx/access.log'
sudo test -f /var/log/mysql/slow.log && sudo sh -c 'echo -n "" > /var/log/mysql/slow.log'

FROM=`date +%s%N | cut -b1-13`
DATE=`date +"%m%d%I%M"`

{% if main_server %}
./github/github create-issue --token $GITHUB_TOKEN --repo $GITHUB_REPO --date $DATE
{% else %}
sleep 5
{% endif %}

sleep 75

TO=`date +%s%N | cut -b1-13`

# Measure
mkdir -p ~/results/$DATE

sudo mysqldumpslow -s t /var/log/mysql/slow.log | head -n 30 > ~/results/$DATE/mysql-slow.log
sudo cat /var/log/mysql/slow.log | pt-query-digest --explain \
    u=$MYSQL_USER,p=$MYSQL_PASS,D=$MYSQL_DBNAME --limit 4 \
    > ~/results/$DATE/mysql-explain.log

sudo alp ltsv --config alp.yaml > ~/results/$DATE/alp.log

echo "http://localhost:{{ netdata_port }}/#menu_apps_submenu_cpu;after=$FROM;before=$TO" > ~/results/$DATE/netdata.txt

./github/github comment-issue --token $GITHUB_TOKEN --repo $GITHUB_REPO --date $DATE --server {{ ansible_host }}
