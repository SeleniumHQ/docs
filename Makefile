# You can set these variables from the command line:
SPHINXOPTS  := -W
SPHINXBUILD := sphinx-build
PAPER       :=

# Internal variables
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d _build/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: all clean html check themes

all: AUTHORS html

clean:
	-rm -rf _build/*
	-rm -rf authors.rst AUTHORS

_build/doctrees:
	mkdir -p _build/doctrees

html: authors.rst _build/doctrees themes
	mkdir -p _build/html
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) _build/html
	@echo
	@echo "Build finished.  The HTML pages are in _build/html."

linkcheck: _build/doctrees
	mkdir -p _build/linkcheck
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) _build/linkcheck
	@echo
	@echo "Link check complete.  Look for any errors in the above output " \
	      "or in _build/linkcheck/output.txt."

themes:
	@true

AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf > $@

authors.rst:
	git log --use-mailmap --format="* %aN" | sort -uf > $@
