---
layout: page
title:  "Rails: View e Controller"
date:   2017-01-13 20:20:00 -0300
categories: aula
---

Nos exemplos a seguir, linhas começadas por `$` são comandos que devem ser executados no terminal do Linux. Linhas começadas por `>` são comandos do rails console.

## Controladores

Um **controlador** é uma classe responsável por receber as requisições do usuário, processá-las e então devolver a resposta. Para isso, ele se comunica com uma **view**, responsável por construir a resposta (geralmente uma página HTML) e com o **model**, responsável pela lógica e persistência dos dados.

O **roteador** (*router*) é um arquivo responsável por traduzir as rotas (requisições web) em chamadas a métodos de controladores.

## Exemplo mínimo

Para começar, vamos criar um controlador que exibe "Alo mundo", e criar uma rota para ele.

Execute o seguinte comando:

```bash
$ rails generate controller disciplinas
```

O comando vai criar vários arquivos, mas por enquanto o único arquivo importante é o `app/controllers/disciplinas_controller.rb`. Edite o arquivo:

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
    render html: "Alo mundo"
  end
end
```

Cada método público do controlador é chamado de **ação**. Vamos agora mapear a rota `/disciplinas` para a ação `index` do controlador `DisciplinasController`:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # ...
  
  get '/disciplinas', to: 'disciplinas#index'
  
  # ...
end
```

Salve os arquivos, reinicie o servidor e abra a URL `enderecodesuaaplicacao.com/disciplinas` (troque o que está antes da barra pelo endereço real). Você deve ver uma página em branco com o texto "Alo mundo".

## Introduzindo uma view

Apague o corpo do método `index` do seu Controller:

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
  end
end
```

Desse jeito, o Rails vai retornar a página localizada em `app/views/disciplinas/index.html.erb`, por convenção. Crie o arquivo com o seguinte conteúdo:

```html
<h1>Alo mundo com view</h1>
```

Recarregue a página `/disciplinas` no seu navegador. Você deve ver a nova página.

## Passando variáveis do controller para a view

Todas as variáveis de instância (cujo nome começa com `@`) ficam acessíveis na view.

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
    @nome = "Terra"
  end
end
```

Agora altere a view:

```html
<h1>Alo <%= @nome %>!</h1>
```

Ao acessar a página novamente no navegador, `<%= @nome %>` vai ser substituído pelo resultado da expressão Ruby entre `<%=` e `%>`, que neste caso é `Terra`.

## Código mais complexo na view

Vamos agora saudar várias pessoas:

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
    @nomes = ["Fulano", "Sicrano", "Beltrano"]
  end
end
```

Agora edite a view:

```html
<% @nomes.each do |nome| %>
  <h1>Alo <%= nome %>!</h1>
<% end %>
```

O nome do arquivo é `index.html.erb` porque ele está no formato *embedded ruby*, que é um arquivo que possui código Ruby embutido entre `<%`/`<%=` e `%>`. O que está entre `<%` (sem `=`) e `%>` vai ser executado como código Ruby, mas não vai gerar nenhum texto para a página.

## Interagindo com o modelo

Assumindo que você criou a classe Disciplina dentro de `app/models` ([veja o guia de models do Rails](rails-model)), você pode consultar suas instâncias e mostrar na página:

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.all
  end
end
```

View:

```html
<% @disciplinas.each do |disc| %>
  <h1><%= disc.codigo %> - <%= disc.nome %></h1>
<% end %>
```

Use o `rails console` pra criar novas instâncias e ver como a página fica.

## Trabalhando com templates

Acesse novamente a página de listagem de disciplinas em `/disciplinas` e olhe seu código-fonte no navegador. O código-fonte não tem só o conteúdo do arquivo `index.html.erb`; ele também contém tags como `<html>, `<head>` e `<title>`. De onde vêm essas coisas?

Para construir a página que é retornada ao servidor, o Rails mistura a sua página com um arquivo de *layout* localizado em `app/views/layouts/application.html.erb`. Seu conteúdo é mais ou menos o seguinte:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Mata62Alo</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

A tag `<%= yield %>` sinaliza onde vai ser inserido o conteúdo da nossa view, `index.html.erb`.

## Trabalhando com partials

Os elementos que devem aparecer em todas as páginas ficam no arquivo de layout. E os elementos que devem aparecer em algumas páginas, mas não todas? Para isso podemos usar *partials*.

Vamos criar três páginas, uma de listagem de disciplinas, uma de exibição e outra de edição. Primeiro o controller:

```ruby
# app/controllers/disciplinas_controller.rb
class DisciplinasController < ApplicationController
  def index
    @nomes = ["Paradigmas de Ling Prog", "Engenharia de Software I", "Algoritmos e Grafos"]
  end

  def show
    @nome = "Engenharia de Software I"
  end

  def edit
    @nome = "Engenharia de Software I"
  end
end
```

Crie as rotas no arquivo `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # ...
  
  get '/disciplinas', to: 'disciplinas#index'
  get '/disciplinas/show', to: 'disciplinas#show'
  get '/disciplinas/edit', to: 'disciplinas#edit'
  
  # ...
end
```

Agora as views. Arquivo `app/views/disciplinas/index.html.erb`:

```html
<% @nomes.each do |nome| %>
  <p><%= nome %></p>
<% end %>
```

Arquivo `app/views/disciplinas/show.html.erb`:

```html
<h1>Disciplina: <%= @nome %></h1>
<h2>Visualizar</h2>
```

Arquivo `app/views/disciplinas/edit.html.erb`:

```html
<h1>Disciplina: <%= @nome %></h1>
<h2>Editar</h2>
```

Reinicie o servidor e teste suas páginas.

Note que há uma duplicação da primeira linha de código nos arquivos `show.html.erb` e `edit.html.erb`. Podemos mover essa linha para um *partial*. *Partials* são representados por arquivos que começam por `_`.

Vamos criar o arquivo `app/views/disciplinas/_titulo.html.erb`:

```html
<h1>Disciplina: <%= @nome %></h1>
```

E, nos arquivos `show.html.erb` e `edit.html.erb`, substitua a primeira linha por

```html
<%= render 'titulo' %>
```

## Passando parâmetros para partials

Agora as páginas ficaram assim:

Arquivo `app/views/disciplinas/show.html.erb`:

```html
<%= render 'titulo' %>
<h2>Visualizar</h2>
```

Arquivo `app/views/disciplinas/edit.html.erb`:

```html
<%= render 'titulo' %>
<h2>Editar</h2>
```

Podemos reusar ainda mais código passando parâmetros para partials. Altere o arquivo `app/views/disciplinas/_titulo.html.erb`:

```html
<h1>Disciplina: <%= @nome %></h1>
<h2><%= operacao %></h2>
```

Ué, mas de onde vem essa variável `operacao`? Vamos passá-la ao renderizar o partial.

Arquivo `app/views/disciplinas/show.html.erb`:

```html
<%= render 'titulo', operacao: 'Visualizar' %>
```

Arquivo `app/views/disciplinas/edit.html.erb`:

```html
<%= render 'titulo', operacao: 'Editar' %>
```

Você pode passar quantos parâmetros desejar para um partial. Exemplo: `render 'nomedopartial', operacao: 'Editar', usuario: 'Fulano', limite: 10`. (Note que isso é uma chamada ao método `render` passando dois parâmetros: a string `'nomedopartial'` e o hash `{:operacao => 'Editar', :usuario => 'Fulano', :limite => 10}`.

Ver <http://guides.rubyonrails.org/action_view_overview.html>.

