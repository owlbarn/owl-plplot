.PHONY: all
all: build

.PHONY: build
build:
	dune build @install

.PHONY: examples
examples:
	cd examples && dune build

.PHONY: clean
clean:
	dune clean

.PHONY: install
install: build
	dune install