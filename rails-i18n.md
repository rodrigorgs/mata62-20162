---
layout: page
title:  "Rails: internacionalização (i18n)"
date:   2017-02-01 20:20:00 -0300
categories: aula
---

Para traduzir sua aplicação Rails para o português, adicione a seguinte linha ao `Gemfile`:

```ruby
gem 'rails-i18n'
```

Baixe as dependências:

```
$ bundle install
```

A seguir adicione as seguintes linhas ao arquivo `config/application.rb`, dentro da classe `Application`:

```
config.i18n.available_locales = [:'pt-BR', :en]
config.i18n.default_locale = :'pt-BR'
```

Se sua aplicação estiver rodando, você precisará reiniciá-la.

## Pluralização

O Rails às vezes pluraliza os nomes das entidades que você cria (como model, view ou controller). Por exemplo, ao rodar `rails generate model post titulo:string`, você informa o nome `post`, mas o Rails cria uma tabela no banco de dados com o plural, `posts`. Infelizmente, Rails às vezes erra no plural das palavras em português, (ex.: `acao` vira `acaos`), então você precisa ensiná-lo a forma correta.

Edite o arquivo `config/initializers/inflections.rb` para informar os plurais irregulares. Exemplo:

```
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'acao', 'acoes'
end
```

## Avançado

Se você quiser editar alguma tradução do Rails, você precisará criar um arquivo `config/locales/pt-BR.yml` com as traduções desejadas. Você pode se basear no arquivo disponível em <https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/pt-BR.yml>.