# File: Makefile
SHELL           = /bin/bash
PROJECT         = paper
PS2PDF          = ps2pdf14
DVIPS_FLAGS     = -Pcmz -Pamz -tA4

.PHONY          = all clean

.PRECIOUS: $(PROJECT).ps

all: ${PROJECT}.pdf

${PROJECT}.pdf: ${PROJECT}.tex
	pdflatex $(<)
	-bibtex ${PROJECT}
	pdflatex $(<)
	pdflatex $(<)

force:
	$(MAKE) -W $(PROJECT).tex

clean:
	rm -f *.{out,brf,toc,lof,bbl,blg,bak,aux,dvi,ps,log} *~ $(PROJECT).pdf

