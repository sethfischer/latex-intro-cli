all	:	\
helloworld/helloworld.pdf \
presentation.pdf \
presentation_compressed.pdf

helloworld/helloworld.pdf	:	helloworld/helloworld.tex
	pdflatex -output-directory helloworld helloworld/helloworld

presentation.pdf	:	FORCE
	rubber --pdf presentation

presentation_compressed.pdf	:	presentation.pdf
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$@ $^

clean:
	rubber --pdf --clean presentation
	-rm -f helloworld/*.aux helloworld/*.log helloworld/*.pdf
	-rm -f presentation.vrb presentation_compressed.pdf

FORCE:

