
.PHONY: default
default: | build install start

.PHONY: build
build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/main main.go

.PHONY: install
install:
	docker build -t hello-world-go:latest .

.PHONY: start
start:
	docker-compose up -d