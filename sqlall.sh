set -eux

MYSQL_USER=isuconp
MYSQL_PASS=isuconp
MYSQL_DBNAME=isuconp

cd `dirname $0`

rsync -a ./scripts/exec.sql isucon@isucon1:~/scripts/exec.sql &
wait

ssh isucon@isucon1 "sudo mysql $MYSQL_DBNAME < ~/scripts/exec.sql" &
wait
