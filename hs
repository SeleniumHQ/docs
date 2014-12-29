#!/usr/bin/env python

"""Substitutes inner HTML of an element with supplied content."""

import argparse
import html5lib
import lxml.cssselect
import lxml.html
import sys
import traceback

class NoSuchElementException(Exception):
	pass

def parse(fh):
	return html5lib.parse(fh, treebuilder="lxml", namespaceHTMLElements=False)

def serialize(tree):
	return html5lib.serialize(doc, tree="lxml", omit_optional_tags=True)

def replace(expr, subst, doc, method="css"):
	el = None
	if method == "xpath":
		el = doc.find(expr)
	elif method == "css":
		sel = lxml.cssselect.CSSSelector(expr)
		els = sel(doc)
		if len(els) > 1:
			warning("multiple matches (%d)" % len(els))
		elif len(els) == 1:
			el = els[0]
	else:
		raise ValueError("Unknown method: %s" % method)

	if el is None:
		raise NoSuchElementException("Could not find element by expression: %s" % expr)

	el.text = ""
	for child in el.getchildren():
		el.remove(child)

	frags = lxml.html.fragments_fromstring(subst)
	if type(frags[0]) == str:
		el.text = frags.pop(0)
	el.extend(frags)

	return doc

def warning(msg):
	print >> sys.stderr, " %s: warning: %s" % (sys.argv[0], msg)

def error(exc):
	msg = exc.message[0].lower() + exc.message[1:]
	print >> sys.stderr, "%s: error: %s" % (sys.argv[0], msg)

if __name__ == "__main__":
	parser = argparse.ArgumentParser(
		description="Subsitutes inner HTML of an element "
		"with supplied content by CSS locator or XPath expression.")
	parser.add_argument("expression", metavar="EXPRESSION",
		help="the expression to find the element by")
	parser.add_argument("substitution", metavar="SUBSTITUTION",
		help="the substitution string")
	parser.add_argument("document", metavar="DOCUMENT",
		type=argparse.FileType("rb"), default=sys.stdin,
		help="the document to operate on")
	parser.add_argument("-x", dest="xpath", action="store_true",
		help="use XPath expression instead of CSS locator")
	args = parser.parse_args()

	subst = args.substitution
	if len(subst) > 0 and subst[0] == "@":
		with open(subst[1:], "r") as fh:
			subst = fh.read()

	src = parse(args.document)
	try:
		doc = replace(args.expression, subst, src, method="xpath" if args.xpath else "css")
	except Exception as e:
		error(e)
		traceback.print_exc()
		sys.exit(1)

	print serialize(doc).encode("utf-8").strip()
