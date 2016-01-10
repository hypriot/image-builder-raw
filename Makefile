.PHONY: build
default: build

build:
	docker build -t image-builder-raw .

rpi-raw-image: build
	docker run --rm --privileged -v $(shell pwd):/workspace image-builder-raw /build/rpi.sh

shell: build
	docker run -ti --privileged -v $(shell pwd):/workspace image-builder-raw bash
