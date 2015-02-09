all: build

build:
	bundle exec rake

test:
	rm -rf tmp && bundle exec rake

clean:
	rm -rf tmp

.PHONY: build clean test
