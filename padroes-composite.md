---
layout: page
title:  "Padrões de projeto: Composite"
date:   2017-03-22 20:20:00 -0300
categories: aula
---

## Propósito

Compor objetos em estruturas de árvore para representar hierarquias todo-parte. O composite permite que os clientes tratem objetos individuais e composições de objetos de maneira uniforme.

## Motivação/Exemplo

Vamos criar um sistema para uma lanchonete. Inicialmente precisamos representar preços dos produtos.

<div class="uml">
class Conta {
}
Conta o-right- Produto

interface Produto {
  custo() : float
}

class Pao extends Produto {
  custo() : float
}

class Queijo extends Produto {
  custo() : float
}

class Salada extends Produto {
  custo() : float
}

class BatataFrita extends Produto {
  custo() : float
}
</div>

E se quisermos representar sanduíches complexos e combinações de produtos? exemplo:

- **X-salada**: pão, queijo e salada
- **Combo 1**: x-salada e batata frita

## Solução

<div class="uml">
class Conta {
}
Conta o-right- Produto

interface Produto {
  custo() : float
}

class Pao extends Produto {
  custo() : float
}

class etc extends Produto {
  custo() : float
}

class ProdutoComposto extends Produto {
  custo() : float
  adicionar(p : Produto)
  remover(p : Produto)
  getParte(i : int) : Produto
}
ProdutoComposto o-- "produtos *" Produto
note right of ProdutoComposto::custo()
  total = 0
  for (p in produtos) do
    total += p.custo()
  end
  return total
end note

' alinhamento
Pao -[hidden]right-> etc
etc -[hidden]right-> ProdutoComposto
</div>

Exemplo de uso:

```ruby
xsalada = ProdutoComposto.new
xsalada.add(Pao.new)
xsalada.add(Queijo.new)
xsalada.add(Salada.new)

combo1 = ProdutoComposto.new
combo1.add(xsalada)
combo1.add(BatataFrita.new)
```

Note que produtos compostos podem conter outros produtos compostos.

## Estrutura do Padrão

<div class="uml">
class Cliente {
}
Cliente o-right- Componente

interface Componente {
  operacao() : float
}

class Folha extends Componente {
  operacao() : float
}

class Composto extends Componente {
  operacao() : float
  adicionar(c : Componente)
  remover(c : Componente)
  getParte(i : int) : Componente
}
Composto o-- "*" Componente
note right of Composto::operacao()
  for (c in componentes) do
    c.operacao()
  end
  return total
end note

' alinhamento
Folha -[hidden]right-> Composto
</div>
