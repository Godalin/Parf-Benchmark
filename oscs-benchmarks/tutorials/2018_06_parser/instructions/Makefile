#

all: tuto.pdf tuto.html

tuto.pdf: tuto.md
	pandoc --from=markdown --to=latex --latex-engine=xelatex tuto.md --output=tuto.pdf

tuto.html: tuto.md
	pandoc --from=markdown --to=html tuto.md --css pandoc.css --output=tuto.html



genealogie:
	mlpost -mps genealogie.ml
	pdflatex genealogie.tex
	pdfcrop genealogie.pdf
	convert -density "300" genealogie-crop.pdf genealogie.png
