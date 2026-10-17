CC = gcc
CLINKS = -lraylib
CFLAGS = -Wall -Wextra -O3 -Iinclude -march=native -flto -std=c11

sources = $(wildcard src/*.c)
objects = $(patsubst src/%.c,build/%.o,$(sources))
executable = template

.PHONY: all debug

all: $(executable)

debug: CFLAGS = -Wall -Wextra -g -Iinclude -std=c11
debug: clean $(executable)

$(executable): $(objects)
	$(CC) $(CFLAGS) $^ $(CLINKS) -o $@

build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -f $(executable) $(objects)

