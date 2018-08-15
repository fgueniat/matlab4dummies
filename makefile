ARTICLE = matlab
REFS = biblio
#LATEX = latex
LATEX = lualatex
#DVIPROC = dvipdf
#lualatex -synctex=1

SOURCEFILES = preamble.tex $(ARTICLE).tex $(REFS).bib $(shell ls fig/*.eps) $(shell ls fig/tikz/*.tex) $(shell ls fig/tikz_matrix/*.pdf) 

all: $(ARTICLE).pdf

$(ARTICLE).pdf: $(SOURCEFILES) $(ARTICLE).bbl  
	$(LATEX) --shell-escape $(ARTICLE)


$(ARTICLE).bbl: $(REFS).bib 
	$(LATEX) --shell-escape $(ARTICLE)
	$(LATEX) --shell-escape $(ARTICLE)
	bibtex $(ARTICLE)
	$(LATEX) --shell-escape $(ARTICLE)

clean:
	rm -f $(ARTICLE).pdf
clean_all:
	rm -f *.log *.flc *.glo *.gls *.ilg *.nlo *.nls *.glg *.xdy *.aux *.log *.bbl *.blg *.out *.dvi *~ $(ARTICLE).pdf
