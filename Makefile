.PHONY: all
all: build

.PHONY: build
build:
	dune build @install

.PHONY: test
test:
	dune runtest -j 1 --no-buffer -p owl

.PHONY: clean
clean:
	dune clean

.PHONY: install
install: build
	dune install