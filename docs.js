"use strict";

function $(loc) {
	loc = String(loc);
	var els = document.querySelectorAll(loc);
	return els.length > 0 ? els : els[0];
}

window.onload = init;

function init() {
	addStructure();
	addAnchors();
	paginate();
	insertFooter();
}

function addStructure() {}

function addAnchors() {
	var whitelist = "abcdefghijklmnopqrstuvwxyz0123456789 ";
	function sanitise(s) {
		if (!s)
			return;
		s = s.trim().toLowerCase();
		s = Array.prototype.filter.call(s, (c) => { return whitelist.indexOf(c) >= 0 }).join("");
		return s.replace(/\s/g, "_")
	}
	var hs = $("h1, h2, h3 h4, h5, h6");
	for (var h of hs) {
		h.id = sanitise(h.textContent);
	}
}

function paginate() {
	var prev = document.querySelector("link[rel=prev]");
	var next = document.querySelector("link[rel=next]");
	var nav = document.createElement("nav");
	nav.innerHTML = "<a class=prev href=" + prev.href + ">" + prev.title + "</a>" +
		"<a class=next href=" + next.href + ">" + next.title + "</a>";
	document.body.appendChild(nav);
}

// TODO(ato): Warning, this is unsafe.
function insertFooter() {
	var footer = document.createElement("footer");
	var path = window.location.pathname;
	if (path === "/docs" || path === "/docs/")
		path = "/docs/index.html";
	var file = path.substring(path.lastIndexOf("/") + 1);

	footer.innerHTML = "<div class=links>" +
		" </div>" +
		"<div class=meta>" +
		" <p>© 2013-2014, <a href=attr.html>Software Freedom Conservancy</a>." +
		" <p>Last updated " + document.lastModified +
		" <p>" +
		"  <ul>" +
		"   <li><a href=//github.com/seleniumhq/docs/issue>Report a bug</a>" +
		"   <li><a href=//github.com/seleniumhq/docs/edit/gh-pages/" + file + ">Edit</a>" +
		"  </ul>" +
		"</div>";

	document.body.appendChild(footer);
}
