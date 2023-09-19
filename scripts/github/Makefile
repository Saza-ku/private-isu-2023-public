.PHONY: all
all: build local

.PHONY: build
build:
	GOOS=linux GOARCH=amd64 go build -o github main.go

.PHONY: local
local:
	go build -o local main.go
