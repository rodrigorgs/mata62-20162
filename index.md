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

# Prova 1: processos e histórias

Assunto e material:

- Processos de desenvolvimento de software
  - [Slides: introdução à engenharia de software](https://docs.google.com/presentation/d/1fGzQcwumPGmF1uGTMNkFkp4xpHpJQodunkOuqlGru0c/edit#slide=id.g198411f564_0_15)
  - [Notas de aula, UFES (seção 2.2)](https://www.inf.ufes.br/~monalessa/PaginaMonalessa-NEMO/ES_Mestrado/Artigos/ProcessoDeSoftware.pdf)
- Métodos ágeis
  - [Manifesto ágil](http://agilemanifesto.org/iso/ptbr/manifesto.html)
  - [Princípios ágeis](http://agilemanifesto.org/iso/ptbr/principles.html)
- Scrum
  - [Guia do Scrum (pt-BR)](http://www.scrumguides.org/docs/scrumguide/v2016/2016-Scrum-Guide-Portuguese-Brazilian.pdf)
  - [Slides](http://slides.com/rodrigorgs/scrum)
- Histórias do usuário
  - [Interagindo com o cliente](https://rodrigorgs.github.io/mata62/cliente.html)
  - [User stories - O que são? Como Usar?](http://blog.myscrumhalf.com/2011/10/user-stories-o-que-sao-como-usar/)

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
