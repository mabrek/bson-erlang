.PHONY: compile clean

ERLC_FLAGS ?= -Wall -I include +debug_info

SRC	:= $(wildcard src/*.erl)
BEAMS := $(SRC:src/%.erl=ebin/%.beam)

compile: $(BEAMS)

clean:
	@rm -f $(BEAMS)

ebin/%.beam : src/%.erl
	erlc $(ERLC_FLAGS) -o $(dir $@) $<
