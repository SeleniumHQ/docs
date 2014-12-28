"use strict";

window.onload = init;

function init() {
	addStructure();
	addAnchors();
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
	var hs = document.querySelectorAll("h1, h2, h3 h4, h5, h6");
	for (var h of hs) {
		h.id = sanitise(h.textContent);
	}
}
