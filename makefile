SHELL = bash
PREFIX = $(shell if [ -z "$${PREFIX}" ]; then kpsewhich --var-value TEXMFHOME; else echo $${PREFIX}; fi)
DEST = ${PREFIX}/tex/latex/biblatex-jamod

package: build/biblatex-jamod.pdf build/biblatex-jamod.sty

all: package README.rst README.pdf

build/biblatex-jamod.pdf : biblatex-jamod.dtx
	latexmk biblatex-jamod.dtx

build/biblatex-jamod.sty: biblatex-jamod.dtx
	latex -output-directory=build biblatex-jamod.ins

README.rst: biblatex-jamod.dtx
	pandoc --from=latex --to=rst biblatex-jamod.dtx -o README.rst

README.pdf: biblatex-jamod.dtx build/biblatex-jamod.pdf
	cp build/biblatex-jamod.pdf ./README.pdf

install: package
	mkdir -p ${DEST}
	install build/biblatex-jamod.sty ${DEST}/
	install build/biblatex-jamod.pdf ${DEST}/
