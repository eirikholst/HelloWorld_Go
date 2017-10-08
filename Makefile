##
## USER DEFINED VARIABLES
##
IMAGE_NAME := hello-world-go
BUILD_CMD = GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -installsuffix cgo -o bin/main main.go


.PHONY: default
default: | build install start

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: build
build:
	$(BUILD_CMD)

.PHONY: install
install:
	docker build -t $(IMAGE_NAME):latest .

.PHONY: release
release:
	docker build -t $(IMAGE_NAME):$(TAG) .
	docker push $(IMAGE_NAME):$(TAG)
	docker rmi $(IMAGE_NAME):$(TAG)

.PHONY: start
start:
	docker-compose up -d

.PHONY: clean
clean:
	rm -fr bin