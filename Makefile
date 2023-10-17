.PHONY: help
help:
	@echo "make deploy"
	@echo "make fulldeploy"

.PHONY: deploy
deploy: build
	rsync -a webapp isucon@isucon1:/home/isucon/private_isu/ & \
	wait
	ssh isucon@isucon1 /home/isucon/scripts/restart.sh & \
	wait

.PHONY: fulldeploy
fulldeploy: build
	cd ansible && ansible-playbook deploy.yml

.PHONY: build
build:
	cd webapp/golang && GOOS=linux GOARCH=amd64 make
