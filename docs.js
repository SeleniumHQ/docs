"use strict";

function $(loc) {
	loc = String(loc);
	var els = document.querySelectorAll(loc);
	return els.length > 0 ? els : els[0];
}

window.addEventListener("load", addStructure);
window.addEventListener("load", addAnchors);
window.addEventListener("load", addToc);
window.addEventListener("load", paginate);
window.addEventListener("load", insertHeader);
window.addEventListener("load", insertFooter);
window.addEventListener("load", populateHeaderYs);
window.addEventListener("load", populateTocEls);
window.addEventListener("scroll", trackHeaders);
window.addEventListener("scroll", moveToc);

function addStructure() {}

function addAnchors() {
	var whitelist = "abcdefghijklmnopqrstuvwxyz0123456789 ";
	function sanitise(s) {
		if (!s)
			return;
		s = s.trim().toLowerCase();
		s = Array.prototype.filter.call(s, function(c) { return whitelist.indexOf(c) >= 0 }).join("");
		return s.replace(/\s/g, "_")
	}
	var hs = $("h1, h2, h3, h4, h5, h6");
	for (var i=0; i< hs.length; i++) {
		hs[i].id = sanitise(hs[i].textContent);
	}
}

function addToc() {
	var toc = document.createElement("nav");
	toc.id = "toc";
	toc.innerHTML = "<h1><a href=index.html>Table of Contents</a></h1>";
	var hs = $("h1, h2, h3, h4, h5, h6");
	for (var i=0; i< hs.length; i++) {
		var level = hs[i].tagName.substring(1);
		if (level == 1)
			continue;
		toc.innerHTML += "<a href=#" + hs[i].id + " class=level" + level + ">" + hs[i].textContent + "</a>"
	}
	document.body.insertBefore(toc, document.body.firstChild);
}

function paginate() {
	var prev = document.querySelector("link[rel=prev]");
	var next = document.querySelector("link[rel=next]");
	var nav = document.createElement("nav");
	nav.id = "pagination";
	if (prev)
		nav.innerHTML = "<a class=prev href=" + prev.href + ">" + prev.title + "</a>";
	if (next)
		nav.innerHTML += "<a class=next href=" + next.href + ">" + next.title + "</a>";
	if (prev || next)
		document.body.appendChild(nav);
}

function insertHeader() {
	var header = document.createElement("header");
	header.innerHTML = "<h1>Selenium Documentation</h1>";
	document.body.insertBefore(header, document.body.firstChild);
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
		" <p>© 2013-2015, <a href=attr.html>Software Freedom Conservancy</a>." +
		" <p>Last updated " + document.lastModified +
		" <p>" +
		"  <ul>" +
		"   <li><a href=//github.com/seleniumhq/docs/issues>Report a bug</a>" +
		"   <li><a href=//github.com/seleniumhq/docs/edit/gh-pages/" + file + ">Edit</a>" +
		"  </ul>" +
		"</div>";

	document.body.appendChild(footer);
}

var hs = [];
var headerYs = {};
var curHeader = null;
var tocEls = {};

function populateHeaderYs() {
	var hdrs = $("h1[id], h2[id], h3[id], h4[id], h5[id], h6[id]");
	for (var i=0; i< hdrs.length; i++) {
		hs.push(hdrs[i]);
		headerYs[hdrs[i].offsetTop] = hdrs[i].id;
	};
}

function populateTocEls() {
	var els = $("nav#toc > a");
	for (var i=0; i< els.length; i++) {
		var anchor = els[i].href.substring(els[i].href.indexOf("#"));
		tocEls[anchor] = els[i];
	}
}

function trackHeaders(ev) {
	var pageY = ev.pageY;
	var cur = hs[0].id;
	var gone = Object.keys(headerYs).filter(function(y, h) { return y <= pageY });
	if (gone.length > 0) {
		var curY = gone[gone.length - 1];
		cur = headerYs[curY];
	}
	updateToc(cur);
}

function updateToc(id) {
	if (curHeader == id) {
		return;
	}
	Object.keys(tocEls).map(function(id) { tocEls[id].classList.remove("current") });
	var sel = "#" + id;
	if (!(sel in tocEls))
		return;
	curHeader = tocEls[sel];
	curHeader.classList.add("current");
}

function moveToc(ev) {
	var toc = $("nav#toc")[0];
	var firstEl = $("nav + h1")[0];
	var firstElSt = firstEl.getBoundingClientRect();
	var offset = document.body.classList.contains("front") ? 300 : 200;

	var firstElRealTop = firstElSt.bottom - (firstElSt.height - offset);
	if (firstElRealTop - 50 < 0) {
		toc.style.top = "50px";
	} else {
		toc.style.top = firstElSt.y + offset + "px";
	}
}
