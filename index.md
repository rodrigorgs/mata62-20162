---
layout: page
title:  "Início"
date:   2016-07-06 20:20:00 -0300
---

Horários: QUA/SEX, 20:20-22:10

Local:

- QUA: laboratório 140 do Instituto de Matemática
- SEX: sala 119 do PAF I

Site: [v.ht/mata62](http://v.ht/mata62)

# Material de aula

- Arquivos (slides e outros): <https://drive.google.com/drive/folders/0BxqQol81uO5UTFJjSnlwQmd4anM?usp=sharing>
- Fórum (Piazza): <https://piazza.com/ufba.br/summer2016/mata62>

Páginas:

<ul>
{% assign sorted = (site.pages | sort: 'date') | reverse %}
{% for page in sorted %}
{% if page.categories contains 'aula' %}
<li><a href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a> (<span class="post-meta">{{ page.date | date: "%b %-d, %Y" }}</span>)</li>
{% endif %}
{% endfor %}
</ul>

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>
