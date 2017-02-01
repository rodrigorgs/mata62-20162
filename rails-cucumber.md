---
layout: page
title:  "Rails: Cucumber"
date:   2017-02-01 20:20:00 -0300
categories: aula
---

## Configuração

Edite o arquivo `Gemfile`, acrescentando as seguintes linhas:

```ruby
group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
end
```

Rode o comando (na pasta raiz do projeto, sem o `$`):

```
$ bundle install
```

Agora inicialize o Cucumber:


```
$ rails generate cucumber:install capybara
$ rails generate cucumber_rails_training_wheels:install
```

Por fim, baixe o arquivo de definição de *steps*:

```
$ wget https://gist.githubusercontent.com/rodrigorgs/f280e294e3d8ea42aad18f4d57653aec/raw/d2fa29d612ad8c74beb398825cac8bd2e8b0f5d3/web_steps.rb -O features/step_definitions/web_steps.rb
```

## Exemplo

Crie páginas para gerenciar *posts*, se ainda não o tiver feito:

```ruby
$ rails generate scaffold post titulo:string conteudo:text
$ rake db:migrate
```

Crie um arquivo `features/CriarPost.feature` com o seguinte conteúdo:

```cucumber
# language: pt

Funcionalidade: Criar post

Cenário: Criar post válido

  Dado que eu estou na página "New Post"
  Quando eu preencher o "Titulo" com "Primeiro post"
  E eu preencher o "Conteudo" com "Bla-bla-bla"
  E eu clicar no botão "Create Post"
  Então eu devo estar na página "Show Post"
  E eu devo ver "Primeiro post"
  E eu devo ver "Bla-bla-bla"

Cenário: Criar post sem título dá erro

  Dado que eu estou na página "New Post"
  Quando eu preencher o "Conteudo" com "Bla-bla-bla"
  E eu clicar no botão "Create Post"
  Então eu devo ver "Titulo can't be blank"
```

Edite o arquivo `features/support/paths.rb`, adicionando:

```ruby
    when 'New Post'
      new_post_path
    when 'Show Post'
      post_path(Post.first)
```

Então execute

```
$ rake db:test:prepare && rake cucumber
```

O primeiro cenário passou, mas o segundo não. Para fazer o segundo cenário passar, edite o arquivo `app/models/post.rb` para ficar assim:

```ruby
class Post < ApplicationRecord
  validates_presence_of :titulo
end
```