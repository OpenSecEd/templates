.PHONY: all
all: texgen texgen.pdf texgen.tar.gz

texgen: texgen.sh
	${LN} -f $^ $@

texgen.sh: texgen.nw

texgen.pdf: texgen.tex
texgen.pdf: notes.tex
texgen.pdf: slides.tex
texgen.pdf: abstract.tex
texgen.pdf: preamble.tex
texgen.pdf: contents.tex
texgen.pdf: acknowledgements.tex
texgen.pdf: letter.tex
texgen.pdf: Makefile.guide
texgen.pdf: Makefile.notes
texgen.pdf: Makefile.root
texgen.pdf: Makefile.slides
texgen.pdf: program.nw
texgen.pdf: Makefile.noweb
texgen.pdf: README.md.template
texgen.pdf: CONTRIBUTING.md.template
texgen.pdf: LICENSE.CC
texgen.pdf: LICENSE.MIT

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

PKG_INSTALL_FILES-share+=	README.md.template
PKG_INSTALL_FILES-share+=	CONTRIBUTING.md.template
PKG_INSTALL_FILES-share+=	LICENSE.CC
PKG_INSTALL_FILES-share+=	LICENSE.MIT
PKG_INSTALL_FILES-share+=	abstract.tex
PKG_INSTALL_FILES-share+=	contents.tex
PKG_INSTALL_FILES-share+=	notes.tex
PKG_INSTALL_FILES-share+=	preamble.tex
PKG_INSTALL_FILES-share+=	slides.tex
PKG_INSTALL_FILES-share+=	Makefile.root
PKG_INSTALL_FILES-share+=	Makefile.notes
PKG_INSTALL_FILES-share+=	Makefile.slides
PKG_INSTALL_FILES-share+=	Makefile.guide
PKG_INSTALL_FILES-share+=	program.nw
PKG_INSTALL_FILES-share+=	Makefile.noweb
PKG_INSTALL_FILES-share+=	letter.tex

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
