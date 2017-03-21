---
layout: page
title:  "Padrões de projeto: Adapter"
date:   2017-03-22 20:20:00 -0300
categories: aula
---

Também conhecido como Wrapper (embrulho).

## Propósito

Converter a interface de uma classe em outra interface que o cliente espera. Adapter possibilita que classes funcionem juntas mesmo com interfaces incompatíveis.

## Motivação/Exemplo

Você adquiriu um sistema de padaria que possui classes que representam os preços dos alimentos:

<div class="uml">
interface Alimento {
  nome() : string
  preco() : float
}

class Pao extends Alimento {
  preco() : float
}

class Queijo extends Alimento {
  preco() : float
}
</div>

Você também adquiriu um sistema financeiro, e precisa integrar esse sistema ao seu sistema de padaria atual:

<div class="uml">
skinparam nodesep 70
class CaixaRegistradora {
  adiciona(p: Produto)
  calculaTotal() : float
}
CaixaRegistradora o-right- "*" Produto
interface Produto {
  valor() : float
}
</div>


O problema é a interface:

- O sistema financeiro depende de classes que implementam a interface `Produto`, com método `valor()`
- O sistema de padaria possui classes que implementam a interface `Alimento`, com método `preco()`

Como fazer os dois sistemas "conversarem" sem alterar nem um sistema, nem o outro?

## Solução

<div class="uml">
skinparam nodesep 80

class CaixaRegistradora {
  adiciona(p: Produto)
  calculaTotal() : float
}
CaixaRegistradora o-right- "*" Produto
interface Produto {
  valor() : float
}
class ProdutoAdapter implements Produto {
  initialize(a : Alimento)
  valor() : float
}
ProdutoAdapter -right-> "alimento" Alimento
interface Alimento {
  nome() : string
  preco() : float
}
note left of ProdutoAdapter::valor()
  return alimento.preco()
end note
class Pao extends Alimento {
  preco() : float
}

class Queijo extends Alimento {
  preco() : float
}
</div>

Exemplo de uso:

```ruby
caixa = CaixaRegistradora.new
caixa.add(ProdutoAdapter.new(Pao.new))
caixa.add(ProdutoAdapter.new(Queijo.new))
puts caixa.calculaTotal()
```

## Estrutura do Padrão

<div class="uml">
skinparam nodesep 80
Cliente -right-> Alvo

interface Alvo {
  operacao()
}
class Adaptador implements Alvo {
  operacao()
}
Adaptador -right-> "adaptado" Adaptado
class Adaptado {
  operacaoEspecifica()
}
note left of Adaptador::operacao()
  adaptado.operacaoEspecifica()
end note
</div>
