all: main

main: main.zig
	zig build-exe $<

test:
	find . -name '*.zig' | xargs -I{} zig test {}

clean:
	-rm main main.o

.PHONY: all test clean
