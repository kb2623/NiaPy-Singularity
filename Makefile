BUILD_DEFINITION_FILE = niapy.def
IMAGE_FILE = niapy.sif
CONTAINER_NAME = niapy

SINGULARITY_CACHEDIR=$(pwd)/build

build:
	make build_singularity

start:
	make start_singularity

stop:
	make stop_singularity

build_singularity: $(BUILD_DEFINITION_FILE)
	singularity build --fakeroot $(IMAGE_FILE) $(BUILD_DEFINITION_FILE)

start_singularity: $(IMAGE_FILE)
	singularity instance start $(IMAGE_FILE) $(CONTAINER_NAME)

stop_singularity: $(shell singularity instance list $(CONTAINER_NAME))
	singularity instance stop $(CONTAINER_NAME)

