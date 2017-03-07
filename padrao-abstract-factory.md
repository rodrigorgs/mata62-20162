---
layout: page
title:  "Padrões de projeto: Abstract Factory"
date:   2017-03-08 20:20:01 -0300
categories: aula
---

<div class="uml">
interface FabricaAbstrata {
  {abstract} criaProdutoA()
  {abstract} criaProdutoB()
}
FabricaAbstrata <|-- FabricaConcreta1
FabricaAbstrata <|-- FabricaConcreta2

class FabricaConcreta1 {
  criaProdutoA()
  criaProdutoB()
}
class FabricaConcreta2 {
  criaProdutoA()
  criaProdutoB()
}
Cliente -left-> FabricaAbstrata
Cliente --> ProdutoAbstratoA
Cliente --> ProdutoAbstratoB

interface ProdutoAbstratoA {
}
interface ProdutoAbstratoB {
}

ProdutoAbstratoA <|-- ProdutoA1
ProdutoAbstratoA <|-- ProdutoA2

ProdutoAbstratoB <|-- ProdutoB1
ProdutoAbstratoB <|-- ProdutoB2

FabricaConcreta1 ..> ProdutoA1
FabricaConcreta1 ..> ProdutoB1

FabricaConcreta2 ..> ProdutoA2
FabricaConcreta2 ..> ProdutoB2

' alinhamento
ProdutoAbstratoB -[hidden]left-> FabricaConcreta2
ProdutoAbstratoB -[hidden]left-> FabricaConcreta1
ProdutoAbstratoA -[hidden]left-> FabricaConcreta2
ProdutoAbstratoA -[hidden]left-> FabricaConcreta1
</div>
