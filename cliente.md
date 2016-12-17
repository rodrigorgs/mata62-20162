---
layout: page
title:  "Interagindo com o cliente"
date:   2016-12-16 20:20:00 -0300
categories: aula
---

## Histórias do usuário

Ver também: <http://slides.com/rodrigorgs/user-stories>

- Usadas em métodos ágeis como forma de documentar requisitos.
- Cada história descreve sucintamente algo que o usuário precisa fazer para atingir seus objetivos através de um sistema de software.
	- Deve ser escrita na linguagem do usuário, sem jargões de programação.

Template Connextra:

- Como *papel* -- *(quem?)*
- Eu quero *fazer algo* -- *(o quê?)*
- Para que *eu obtenha um resultado ou benefício* -- *(por quê?)*

Acrônimos:

- CCC: Card, Conversa, Confirmação (critérios de aceitação)
- INVEST: independentes, negociáveis, valiosas, estimáveis, small (pequenas), testáveis
- SMART: eSpecífica, Mensurável, Atingível, Relevante, Temporizável

Exemplo (por Armando Fox):

- Específica:
	- (vago) O usuário pode buscar um filme
	- (específico) O usuário pode buscar um filme por título
- Mensurável:
	- (não-mensurável) O site deve ter um bom tempo de resposta
	- (mensurável) Ao adicionar um filme, 99% das páginas "Adicionar Filme" devem aparecem dentro de 3 segundos
- Atingível:
	- Idealmente você deve resolver a história em uma iteração; se não der, divida a história em histórias menores.
- Relevante:
	- A história deve ter valor para um ou mais stakeholders (interessados no sistema). Pergunte "por quê?" até o valor ficar claro
	- Considere a funcionalidade "associar conta ao Facebook" para o site de venda de ingressos de um cinema.
		- Por que adicionar essa funcionalidade? Como gerente de um cinema, eu acho que mais pessoas irão ao cinema com amigos e vão curtir mais o filme.
		- Por que importa que eles gostem mais do filme? Eu acho que nós venderemos mais ingressos.
		- Por que você quer vender mais tíquetes? Por que o cinema vai ganhar mais dinheiro.
		- Por que o cinema quer ganhar mais dinheiro? Para não falir.
		- Por que é importante o cinema não falir? Por que, se falir, perco o emprego.
- Temporizável:
	- Significa que você deve parar de desenvolver a história se ultrapassar o tempo planejado para ela. Você pode desistir, dividir a história em histórias menores, ou reagendar o que falta de acordo com uma nova estimativa de tempo.

Feature:  RottenPotatoes should have good response time (unmeasurable)
Feature:  When adding a movie, 99% of Add Movie pages 
          should appear within 3 seconds (measurable)

## Protótipos de tela

- Lo-Fi
	- Método ágil: abraçar a mudança; queremos o feedback do usuário. Por isso, protótipos de tela devem ser: rápidos de fazer e descartáveis. Não gaste muito tempo fazendo algo muito realista que inibe o feedback e pode não ser o que o cliente quer.
- Storyboards
	- Mostra as interações do usuário (botões, páginas, popups...)

## Reuniões CUPIMMM

- **C**omece e termine a reunião na hora
- **U**ma pessoa falando de cada vez; sem interrupções quando outra pessoa está falando.
- **P**auta da reunião criada antecipadamente; sem pauta, sem reunião
- **I**tens de ação no final da reunião, para que as pessoas saibam o que devem fazer como resultado da reunião
- **M**inuta da reunião deve ser registrada para todos lembrarem os resultados depois; a primeira coisa é encontrar uma pessoa pra tomar notas
- **M**ande materiais antecipadamente, já que ler é mais rápido que esperar outra pessoa falar
- **M**arque data e hora da próxima reunião

Outras dicas:

- No primeiro contato, se apresente, diga seu objetivo com o encontro e [proponha](http://pgbovine.net/good-and-bad-cold-emails.htm) algumas opções de horário.
- O <http://doodle.com/> pode ser usado internamente pela equipe pra achar um horário comum entre todos (se a equipe for distribuída, o que não é o caso da disciplina).
- Se possível, marque ao menos o primeiro encontro no local de trabalho do cliente. Lá ele pode consultar materiais e pessoas que podem ajudar a esclarecer as suas necessidades.


