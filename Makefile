REPORT = paper
LATEX  = pdflatex -shell-escape
BIBTEX = bibtex

SOURCEFILES = $(REPORT).tex $(shell ls  picture/*.png)

all:  $(REPORT).pdf # diff.pdf response1.pdf response2.pdf # sig-nov.pdf highlights.pdf cover.pdf

$(REPORT).pdf: $(SOURCEFILES) $(REPORT).bbl  
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)


$(REPORT).bbl: paper.bib
	$(LATEX) $(REPORT)
	$(BIBTEX) $(REPORT)



clean:
	rm -f *.log *.fdb_latexmk *.flc *.fls *.glo *.gls *.ilg *.nlo *.nls *.glg *.xdy *.aux *.auxlock *.log *.bbl *.blg *.out *.dvi *.pdfsync *~ diff.tex $(REPORT)-figure*.* 

realclean: clean
	rm -f $(REPORT).pdf 

