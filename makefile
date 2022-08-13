package: build/biblatex-jamod.pdf biblatex-jamod.sty

all: package README.rst README.pdf

build/biblatex-jamod.pdf : biblatex-jamod.dtx
	latexmk biblatex-jamod.dtx

biblatex-jamod.sty: biblatex-jamod.dtx
	cd build
	latex biblatex-jamod.ins

README.rst: biblatex-jamod.dtx
	pandoc --from=latex --to=rst biblatex-jamod.dtx -o README.rst

README.pdf: biblatex-jamod.dtx build/biblatex-jamod.pdf
	cp build/biblatex-jamod.pdf ./README.pdf
