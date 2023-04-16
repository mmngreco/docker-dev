.PHONY: all build run push clean

TAG = "0.2.0-debian"
IMAGE_NAME = "dev:${TAG}"
SHELL := /bin/bash


all: build run push

build:
	echo "IMAGE_NAME: ${IMAGE_NAME}"
	docker build \
	--tag "${IMAGE_NAME}" \
		--squash \
		.

run:
	bash docker_run.sh

push:
	bash docker_push.sh

clean:
	docker system prune --all -f
