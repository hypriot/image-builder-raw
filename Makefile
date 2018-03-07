default: build

build:
	docker build -t image-builder-raw .

rpi-raw-image: build
	docker run --rm --privileged -v $(shell pwd):/workspace image-builder-raw /builder/rpi/build.sh

odroid-raw-image: build
	docker run --rm --privileged -v $(shell pwd):/workspace image-builder-raw /builder/odroid/build.sh

shell: build
	docker run --rm -ti --privileged -v $(shell pwd):/workspace image-builder-raw bash

testshell: build
	docker run --rm -ti --privileged -v $(shell pwd)/builder:/builder -v $(shell pwd):/workspace image-builder-raw bash

tag:
	git tag ${TAG}
	git push origin ${TAG}
