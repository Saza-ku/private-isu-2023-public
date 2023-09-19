set -eux

ssh isucon@isucon1 $@ &
wait
