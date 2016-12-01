YP_FILE = FilterParser.yp
PM_FILE = ${YP_FILE:%.yp=%.pm}

.PHONY: all

all: ${PM_FILE}

%.pm: %.yp
	yapp -v $<
