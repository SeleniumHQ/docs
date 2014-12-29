.PHONY: all test validate

CONTENTS = \
	intro.html \
	install.html \
	start.html \
	wd.html \
	remote.html \
	best.html \
	worst.html \
	grid.html \
	drivers.html \
	javasupport.html \
	attr.html \
	conventions.html \
	ack.html

all: AUTHORS toc.tmp $(CONTENTS)

clean:
	rm -f toc.tmp
	rm -f AUTHORS

test: validate

validate: $(CONTENTS)
	@for f in $(CONTENTS) ; do \
		curl -s -F laxtype=yes -F parser=html5 -F level=error -F out=gnu -F doc=@$$f https://validator.nu ; \
	done

toc.tmp: $(CONTENTS) maketoc
	./maketoc -m2 $^ > $@

index.html: toc.tmp
	./hs '#toc' @$< $@ > $@.tmp
	mv $@.tmp $@

AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf > $@

ack.html: AUTHORS
	sed -i '' -e '/\<ul\>/,/\<\/ul\>/d' $@
	echo "<ul>" >> $@
	git log --use-mailmap --format=" <li><a href=mailto:%aE>%aN</a>" | sort -uf >> $@
	echo "</ul>" >> $@
