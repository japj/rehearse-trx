%.png:	%.dot
	dot -Tpng -o $@ $<

dots	:= $(wildcard *.dot)
pngs	:= $(patsubst %.dot,%.png,$(dots))

all:	$(pngs)