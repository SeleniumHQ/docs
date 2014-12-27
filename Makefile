.PHONY: all test validate

CONTENTS = $(wildcard *.html)

all: AUTHORS $(CONTENTS)

clean:
	rm -f AUTHORS

test: validate

validate: $(CONTENTS)
	for f in $(CONTENTS) ; do \
		curl -s -F laxtype=yes -F parser=html5 -F level=error -F out=gnu -F doc=@$$f https://validator.nu ; \
	done

AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf >> $@

ack.html: AUTHORS
	sed -i '' -e '/\<ul\>/,/\<\/ul\>/d' $@
	echo "<ul>" >> $@
	git log --use-mailmap --format=" <li><a href=mailto:%aE>%aN</a>" | sort -uf >> $@
	echo "</ul>" >> $@
