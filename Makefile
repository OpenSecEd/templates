.PHONY: all
all: texgen

texgen: texgen.sh
	${LN} -f $^ $@

texgen.sh: texgen.nw


INCLUDE_MAKEFILES?=	makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
