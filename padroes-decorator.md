---
layout: page
title:  "Padrões de projeto: Decorator"
date:   2017-03-22 20:20:00 -0300
categories: aula
---

<!-- http://nithinbekal.com/posts/ruby-decorators/ -->

## Propósito

Adicionar responsabilidades a um objeto dinamicamente. Decorators fornecem uma alternativa flexível ao uso de herança para estender funcionalidades.

## Motivação/Exemplo

Vamos criar um sistema para uma lanchonete. Inicialmente precisamos representar sanduíches e seus preços:

<div class="uml">
class Hamburguer {
  custo() : float  
}
note right of Hamburguer::custo()
  return 50
end note

class HamburguerComQueijo extends Hamburguer {
  custo() : float  
}
note right of HamburguerComQueijo::custo()
  return 60
end note

class HamburguerGrande extends Hamburguer {
  custo() : float  
}
note right of HamburguerGrande::custo()
  return 65
end note
</div>

E se quisermos um hambúrguer grande com queijo? E se quisermos um hamburguer com queijo duplo? E se tivermos um outro tipo de sanduíche, como o cachorro-quente?

Essa estrutura de herança não é muito flexível... Seria necessário criar muitas subclasses para cobrir todas as possibilidades.

## Solução

<div class="uml">
interface Sanduiche {
  custo() : float
}

class Hamburguer implements Sanduiche {
  custo() : float
}

class CachorroQuente implements Sanduiche {
  custo() : float
}

class SanduicheDecorator implements Sanduiche {
  initialize(s : Sanduiche)
  {abstract} custo() : float
}
SanduicheDecorator o-up- "s" Sanduiche

class Queijo extends SanduicheDecorator {
  initialize(s : Sanduiche)
  custo() : float
}
note right of Queijo::custo()
  return s.custo() + 10
end note

class TamanhoGrande extends SanduicheDecorator {
  initialize(s : Sanduiche)
  custo() : float
}
note right of TamanhoGrande::custo()
  return s.custo() + 15
end note
</div>

Exemplo de uso:

```ruby
hamburguerGrandeComQueijo =
  TamanhoGrande.new(Queijo.new(Hamburguer.new))

hamburguerComQueijoDuplo =
  Queijo.new(Queijo.new(Hamburguer.new))

cachorroQuenteGrande =
  TamanhoGrande.new(CachorroQuente.new)
```

## Estrutura do Padrão

<div class="uml">
interface Componente {
  operacao()
}

class ComponenteConcreto implements Componente {
  operacao()
}

interface Decorator extends Componente {
  operacao()
}
Decorator o-up- "comp" Componente

class DecoratorConcreto1 implements Decorator {
  atributo1
  operacao()
}

class DecoratorConcreto2 implements Decorator {
  operacao()
  outraOperacao()
}
note right of DecoratorConcreto2::operacao()
  comp.operacao()
endnote

' alinhamento
DecoratorConcreto1 -[hidden]right-> DecoratorConcreto2
</div>
