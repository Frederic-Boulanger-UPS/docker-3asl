.PHONY: build run stop

REPO = fredblgr/
IMAGE= 3asl
TAG = 2020

# Build image
build:
	docker build -t $(REPO)$(IMAGE):$(TAG) .

# Clear caches
clean:
	docker builder prune

clobber:
	docker builder prune --all

run:
	docker run --rm -it \
		-v ${PWD}:/workspace:rw \
		--name $(IMAGE) \
		--env="DISPLAY=host.docker.internal:0" \
		$(REPO)$(IMAGE):$(TAG)
