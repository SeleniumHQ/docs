AUTHORS:
	git log --use-mailmap --format="%aN <%aE>" | sort -uf > $@
