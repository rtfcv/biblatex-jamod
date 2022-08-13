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
