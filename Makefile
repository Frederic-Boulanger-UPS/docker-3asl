.PHONY: build clean clobber run push

REPO = fredblgr/
IMAGE= 3asl
VM   = 3asl
TAG  = 2020

help:
	@echo "# Available targets:"
	@echo "#   - build: build docker image"
	@echo "#   - clean: clean docker build cache"
	@echo "#   - run: run docker container"
	@echo "#   - push: push docker image to docker hub"
	@echo "#   - vm: build vagrant virtual machine"
	@echo "#   - ssh: connect to vagrant virtual machine"
	@echo "#   - box: package vagrant virtual machine for distribution"

# Build image
build:
	docker build -t $(REPO)$(IMAGE):$(TAG) .
	@danglingimages=$$(docker images --filter "dangling=true" -q); \
	if [[ $$danglingimages != "" ]]; then \
	  docker rmi $$(docker images --filter "dangling=true" -q); \
	fi

vm:
	vagrant up

box:
	vagrant package --output $(VM).$(TAG).box $(VM).$(TAG)

ssh:
	vagrant ssh

# Clear caches
clean:
	docker builder prune

clobber:
	docker builder prune --all

run:
	docker run --rm -it \
		-v ${PWD}:/workspace:rw \
		--name $(IMAGE) \
		--env "DISPLAY=host.docker.internal:0" \
		$(REPO)$(IMAGE):$(TAG)

push:
	docker push $(REPO)$(IMAGE):$(TAG)
