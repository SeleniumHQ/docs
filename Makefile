.PHONY: all clean test validate

NARRATIVE = \
	intro.html \
	install.html \
	start.html \
	wd.html \
	remote.html \
	best.html \
	worst.html \
	grid.html \
	drivers.html \
	java.html

FRONTMATTER = \
	attr.html \
	typo.html

CONTENTS = index.html quick.html $(NARRATIVE) $(FRONTMATTER)

all: AUTHORS $(CONTENTS)

clean:
	rm -f AUTHORS
	rm -f *.tmp*

test: validate

validate:
	@for f in $(CONTENTS) ; do \
		curl -s -F laxtype=yes -F parser=html5 -F level=error -F out=gnu -F doc=@$$f https://validator.nu | sed -e 's/"//g'; \
	done

gettingstarted.tmp: quick.html
	./maketoc -m2 $^ > $@

narrative.tmp: $(NARRATIVE)
	./maketoc -m2 $^ > $@

frontmatter.tmp: $(FRONTMATTER)
	./maketoc -m2 $^ > $@

index.html: gettingstarted.tmp narrative.tmp frontmatter.tmp
	./hs '#gettingstarted' @gettingstarted.tmp $@ > $@.tmp
	./hs '#narrative' @narrative.tmp $@.tmp > $@.tmp2
	./hs '#frontmatter' @frontmatter.tmp $@.tmp2 > $@
	rm -f *.tmp*

AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf > $@

authors.tmp: AUTHORS
	echo "<ul>" >> $@
	git log --use-mailmap --format=" <li><a href=mailto:%aE>%aN</a>" | sort -uf >> $@
	echo "</ul>" >> $@

attr.html: authors.tmp
	./hs '#authors' @$< $@ > $@.tmp
	mv $@.tmp $@
