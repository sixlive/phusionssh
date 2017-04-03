.PHONY: build start run detatched

# Edit this configs
IMAGE := phusionssh
HOST_PORT := 2288

run:
	docker run -it --rm -p $(HOST_PORT):2222 $(IMAGE)

detatched:
	docker run -d -p $(HOST_PORT):2222 $(IMAGE)

build:
	docker build -t $(IMAGE) .

init:
	rsync -az ~/.ssh/id_rsa* ssh/


default: start
