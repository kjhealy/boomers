## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown or Rmarkdown fies. 
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf 
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this. 
## -	You can specify an output format with `make tex`, `make pdf`,  
## - 	`make html`, or `make docx`.
## -	Doing `make clean` will remove all the .tex, .html, .pdf, and .docx files 
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep! 

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

## Location of Pandoc support files.
PREFIX = /Users/kjhealy/.pandoc

## Location of your working bibliography file
BIB = /Users/kjhealy/Documents/bibs/socbib-pandoc.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = american-sociological-association

## Pandoc options to use
OPTIONS = markdown+simple_tables+table_captions+yaml_metadata_block+smart

## pandoc-citeproc-preamble location
PREAMBLE = config/preamble.tex

MD=$(SRC:.Rmd=.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)


all:	$(MD) $(PDFS) $(HTML) $(TEX) $(DOCX)

md:	clean $(MD)
pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)
docx:	clean $(DOCX)

%.md: %.Rmd
	R --slave -e "set.seed(100);knitr::knit('$<')"

%.html:	%.md
	pandoc -r $(OPTIONS) -w html  --template=$(PREFIX)/templates/html.template --css=$(PREFIX)/marked/kultiad-serif.css --filter pandoc-citeproc --csl=$(PREFIX)/csl/$(CSL).csl --bibliography=$(BIB) -o $@ $<

%.tex:	%.md
	pandoc -r $(OPTIONS) -w latex -s  --pdf-engine=pdflatex --template=$(PREFIX)/templates/latex.template --filter pandoc-citeproc --csl=$(PREFIX)/csl/ajps.csl --bibliography=$(BIB) --filter pandoc-citeproc-preamble -M citeproc-preamble=$(PREAMBLE) -o $@ $<


%.pdf:	%.md
	pandoc -r $(OPTIONS) -s  --pdf-engine=pdflatex --template=$(PREFIX)/templates/latex.template --filter pandoc-citeproc --csl=$(PREFIX)/csl/$(CSL).csl --bibliography=$(BIB) --filter pandoc-citeproc-preamble -M citeproc-preamble=$(PREAMBLE) -o $@ $<


%.docx: %.md
	pandoc -r $(OPTIONS) -w docx   --filter pandoc-citeproc --csl=$(PREFIX)/csl/$(CSL).csl --bibliography=$(BIB) -o $@ $<

clean:
	rm -f *.html *.pdf *.tex *.docx