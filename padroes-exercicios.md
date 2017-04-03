---
layout: page
title:  "Padrões de projeto: exercícios"
date:   2017-03-24 20:20:00 -0300
categories: aula
---

Verdadeiro ou falso?

- AbstractFactory é um padrão com escopo de objeto
- O propósito do padrão Strategy é desacoplar uma classe da implementação de um algoritmo que ela usa
- O padrão Decorator não permite adicionar responsabilidades a um objeto em tempo de execução
- Template Method é um padrão de projeto de criação

Desenhe um diagrama UML representando o padrão de projeto Observer.

Considere uma classe de um sistema que pode ser adaptador para diferentes tipos de lanchonete: hamburguerias, cachorro-quenterias etc.:

<div class="uml">
class Lanchonete {
	preparaPedido()
}
note right of Lanchonete
  instancia objetos do tipo
  Hamburguer ou CachorroQuente,
  a depender da especialidade
  da lanchonete
endnote
Lanchonete --> Hamburguer
Lanchonete --> CachorroQuente
class Hamburguer {
	preco() : float
}
class CachorroQuente {
	preco() : float
}
</div>

Aplique o padrão de projeto *FactoryMethod* para desacoplar a classe `Lanchonete` do tipo específico de sanduíche produzido pela lanchonete.

