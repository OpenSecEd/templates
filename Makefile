.PHONY: all
all: texgen texgen.pdf texgen.tar.gz

texgen: texgen.sh
	${LN} -f $^ $@

texgen.sh: texgen.nw


.PHONY: clean
clean:
	${RM} texgen texgen.sh
	${RM} texgen.tex texgen.pdf
	${RM} texgen.tar texgen.tar.gz


PKG_PACKAGES=				bin share

PKG_NAME=					texgen
PKG_PREFIX=					/usr/local
PKG_INSTALL_DIR-bin=		/bin
PKG_INSTALL_DIR-share=		/share/texgen
PKG_INSTALL_FILES-bin=		texgen
PKG_INSTALL_FILES-share+=	CONTRIBUTING.template
PKG_INSTALL_FILES-share+=	LICENSE.template
PKG_INSTALL_FILES-share+=	README.template
PKG_INSTALL_FILES-share+=	contents.tex
PKG_INSTALL_FILES-share+=	notes.tex
PKG_INSTALL_FILES-share+=	preamble.tex
PKG_INSTALL_FILES-share+=	slides.tex
PKG_INSTALL_FILES-share+=	Makefile.slides
PKG_INSTALL_FILES-share+=	Makefile.studyguide
PKG_TARBALL=				texgen.tar
PKG_TARBALL_FILES=			${PKG_INSTALL_FILES-bin} ${PKG_INSTALL_FILES-share}

texgen.tar.gz: texgen.tar
	${COMPRESS.gz}

post-install-share:
	chmod -R -x ${PKG_PREFIX}${PKG_INSTALL_DIR-share}/*


INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
include ${INCLUDE_MAKEFILES}/package.mk
