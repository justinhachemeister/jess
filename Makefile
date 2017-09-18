PROG=jess

BUILD_DIRECTORY=$(PWD)/build
SOURCE_DIRECTORY=$(PWD)/source

CONFIG_DIRECTORY_NAME=config
DEPENDENCIES_DIRECTORY_NAME=dependencies

build-prep:
	mkdir -p $(BUILD_DIRECTORY)

build:	build-prep
	cp -p $(SOURCE_DIRECTORY)/$(PROG) $(BUILD_DIRECTORY)

clean:
	rm -rf $(BUILD_DIRECTORY)
