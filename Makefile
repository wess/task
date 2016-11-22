
all: run

build:
	@swift build 

install:
	@mv .build/release/task /usr/local/bin/


clean:
	@swift build --clean=dist

xcode:
	@rm -rf task.xcodeproject
	@swift package generate-xcodeproj

run: build
	@.build/debug/task testing

release: clean
	@swift build --configuration release
	

