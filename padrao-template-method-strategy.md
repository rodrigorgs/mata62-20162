---
layout: page
title:  "Padrões de projeto: Template Method e Strategy"
date:   2017-03-10 20:20:01 -0300
categories: aula
---

Template Method

- Template Method é muito parecido com Factory Method, exceto que o propósito aqui não é variar a forma como um objeto é criado, e sim variar um algoritmo (ou pedaço de um algoritmo).
- Analogia: carros com diferentes tipos de transmissão (manual, automática, semiautomática...) -- software para carro autônomo
		- Métodos: calcularRota(a, b), seguirRota(r)
- Exemplo (adaptar exemplo dos padrões estruturais, exceto que, no lugar de criar Cabecalho, Corpo e Rodape, simplesmente escrevemos na tela o cabecalho, o corpo e o rodapé)
- Variações: o template method pode ser abstrato ou concreto (hook); neste último caso, ele provê uma implementação padrão que pode ser sobrescrita
- Desvantagem 1: e se eu quiser trocar o algoritmo usado pelo Context durante a execução do programa?
- Desvantagem 2: e se o Context possuir vários algoritmos que podem variar de forma independente?
		- Ex.: um carro pode variar a transmissão (manual, automática...) e a direção (hidráulica, elétrica...)
		- Subclasses: CarroTransmManualDirHidraulica, CarroTransManualDirEletrica, CarroTransAutomaticaDirHidraulica, CarroTransAutomaticaDirEletrica.

Strategy

- É parecido com o AbstractFactory, exceto que o propósito não é variar a forma como um objeto é criado, e sim variar um algoritmo (ou pedaço de um algoritmo).
- Carro possui TransmissaoStrategy e DirecaoStrategy
- Podemos trocar a transmissão e a direção de forma independente
- Podemos trocar a transmissão e a direção com o carro em movimento!
- Exemplo da vida real: Comparator em Java
