---
title: "Bestand downloads"
weight: 2
---

Het is mogelijk om een download te starten door op een
download knop te klikken. Echter houdt de API geen rekening
met de voortgang van de download. Hierdoor is het niet ideaal
om het downloaden van bestanden te testen.
Bestanden downloaden word niet beschouwd als een belangrijk aspect
binnen het nabootsen van gebruikers.
Wat je wel kan doen is de link van het bestand zoeken via Selenium,
en indien nodig de cookies. Vervolgens deze gegevens doorgeven aan 
een HTTP request bibliotheek zoals [libcurl](//curl.haxx.se/libcurl/).
