TEX      := main.tex
PDF      := $(TEX:.tex=.pdf)
LATEXMK  := latexmk
LATEXMK_OPTS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all pdf watch clean

all: pdf

pdf: $(PDF)

$(PDF): $(TEX) preamble.tex
	$(LATEXMK) $(LATEXMK_OPTS) $<

watch:
	$(LATEXMK) $(LATEXMK_OPTS) -pvc $(TEX)

clean:
	$(LATEXMK) -C
