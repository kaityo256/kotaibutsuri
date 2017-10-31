SRC=sample.tex
DVI=$(SRC:.tex=.dvi)
PDF=$(SRC:.tex=.pdf)
EPS=$(shell ls *.eps)
STY=kotaibutsuri.sty
TEX=platex
DVIPDF=dvipdfmx

.SUFFIXES: .tex .dvi .pdf

all:$(PDF) 
	open $(PDF)

$(DVI): $(SRC) $(EPS) $(STY)

$(PDF): $(DVI) 

.dvi.pdf:
	$(DVIPDF) $<

.tex.dvi: 
	$(TEX) $<
	$(TEX) $<

tar:
	tar cvzf $(TARGET).tar.gz $(TARGET).* $(EPS)

clean:
	rm -f $(DVI) *.aux *.log *.toc *.pbm *.bmc $(PDF)
