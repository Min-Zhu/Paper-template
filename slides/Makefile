# ---------- Configuration ----------
TEX      := slide.tex
PDF      := $(TEX:.tex=.pdf)
LATEX    := pdflatex
LATEXMK  := latexmk
VIEWER   := open          # macOS: open | Linux: xdg-open | Windows: start

# latexmk options: pdfLaTeX, nonstop, output in same dir
LATEXMK_FLAGS := -pdf -pdflatex="$(LATEX) -interaction=nonstopmode -halt-on-error %O %S" \
                 -bibtex- -synctex=1

# ---------- Default target ----------
.PHONY: all
all: $(PDF)

# ---------- Build with latexmk (recommended) ----------
$(PDF): $(TEX)
	$(LATEXMK) $(LATEXMK_FLAGS) $(TEX)

# ---------- Manual build (fallback) ----------
.PHONY: manual
manual:
	$(LATEX) -interaction=nonstopmode -halt-on-error $(TEX)
	$(LATEX) -interaction=nonstopmode -halt-on-error $(TEX)

# ---------- View ----------
.PHONY: view
view: $(PDF)
	$(VIEWER) $(PDF)

# ---------- Clean intermediate files ----------
.PHONY: clean
clean:
	$(LATEXMK) -c $(TEX)
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.fls *.fdb_latexmk *.synctex.gz

# ---------- Clean everything, including PDF ----------
.PHONY: distclean
distclean:
	$(LATEXMK) -C $(TEX)
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.fls *.fdb_latexmk *.synctex.gz

# ---------- Rebuild from scratch ----------
.PHONY: rebuild
rebuild: distclean all

# ---------- Help ----------
.PHONY: help
help:
	@echo "Targets:"
	@echo "  all        Build $(PDF) with latexmk (default)"
	@echo "  manual     Build with two pdflatex runs"
	@echo "  view       Build and open $(PDF)"
	@echo "  clean      Remove intermediate files"
	@echo "  distclean  Remove intermediates and $(PDF)"
	@echo "  rebuild    distclean + all"
	@echo "  help       Show this message"