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
	javasupport.html

FRONTMATTER = \
	attr.html \
	conventions.html \
	ack.html

CONTENTS = $(NARRATIVE) $(FRONTMATTER)

all: AUTHORS $(CONTENTS) index.html

clean:
	rm -f AUTHORS
	rm -f *.tmp

test: validate

validate: $(CONTENTS)
	@for f in $(CONTENTS) ; do \
		curl -s -F laxtype=yes -F parser=html5 -F level=error -F out=gnu -F doc=@$$f https://validator.nu ; \
	done

narrative.tmp: $(NARRATIVE)
	./maketoc -m2 $^ > $@

frontmatter.tmp: $(FRONTMATTER)
	./maketoc -m2 $^ > $@

index.html: narrative.tmp frontmatter.tmp
	./hs '#narrative' @narrative.tmp $@ > $@.tmp
	./hs '#frontmatter' @frontmatter.tmp $@.tmp > $@
	rm -f *.tmp

AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf > $@

ack.html: AUTHORS
	sed -i '' -e '/\<ul\>/,/\<\/ul\>/d' $@
	echo "<ul>" >> $@
	git log --use-mailmap --format=" <li><a href=mailto:%aE>%aN</a>" | sort -uf >> $@
	echo "</ul>" >> $@
