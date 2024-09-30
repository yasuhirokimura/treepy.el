EMACS=	emacs
INSTALL=install -m 644 -p
RM=	rm -f

ELCS=	treepy.elc

.SUFFIXES: .el .elc

.el.elc:
	${EMACS} -Q -batch -L . -f batch-byte-compile $<

all: ${ELCS}

install: ${ELCS}
	${INSTALL} *.el* $$(${EMACS} -Q --batch --eval "(princ (expand-file-name \"../../site-lisp\" data-directory))")

clean:
	${RM} ${ELCS}
