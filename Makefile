.PHONY: help
help:
	@echo "make deploy"
	@echo "make fulldeploy"

.PHONY: deploy
deploy: build
	rsync -a webapp isucon@isucon1:/home/isucon/ & \
	rsync -a webapp isucon@isucon2:/home/isucon/ & \
	rsync -a webapp isucon@isucon3:/home/isucon/ & \
	wait
	ssh isucon@isucon1 /home/isucon/scripts/restart.sh & \
	ssh isucon@isucon2 /home/isucon/scripts/restart.sh & \
	ssh isucon@isucon3 /home/isucon/scripts/restart.sh & \
	wait

.PHONY: fulldeploy
fulldeploy: build
	cd ansible && ansible-playbook deploy.yml

.PHONY: build
build:
	cd webapp/golang && GOOS=linux GOARCH=amd64 make
