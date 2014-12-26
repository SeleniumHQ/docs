.PHONY: all test clean validate

CONTENTS = \
	index.html \
	quick.html \
	intro.html \
	install.html \
	start.html \
	wd.html \
	remote.html \
	best.html \
	worst.html \
	grid.html \
	ide.html \
	drivers.html \
	javasupport.html \
	attr.html \
	conventions.html \
	ack.html

all: $(CONTENTS)

test: validate

clean:
	rm -f authors.html

validate: $(CONTENTS)
	for f in $(CONTENTS) ; do \
		curl -s -F laxtype=yes -F parser=html5 -F level=error -F out=gnu -F doc=@$$f https://validator.nu ; \
	done

ack.html:
	sed -i '' -e '/\<ul\>/,/\<\/ul\>/d' $@
	echo "<ul>" >> $@
	git log --use-mailmap --format=" <li><a href=mailto:%aE>%aN</a>" | sort -uf >> $@
	echo "</ul>" >> $@
