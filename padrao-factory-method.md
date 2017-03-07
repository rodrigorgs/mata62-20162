---
layout: page
title:  "Padrões de projeto: Factory Method"
date:   2017-03-03 20:20:01 -0300
categories: aula
---

<div class="uml">
Produto <|-- ProdutoConcreto
Criador <|-- CriadorConcreto
ProdutoConcreto <-left- CriadorConcreto

class Criador {
  {abstract} novoProduto() : Produto
  algumaOperacao()
}
note right of Criador::algumaOperacao()
  produto = novoProduto()
end note

class CriadorConcreto {
  novoProduto() : Produto
}
note right of CriadorConcreto::novoProduto()
  return new ProdutoConcreto()
end note
</div>
