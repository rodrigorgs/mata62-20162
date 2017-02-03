---
layout: page
title:  "Rails: autenticação"
date:   2017-02-03 20:20:00 -0300
categories: aula
---

Existem diversas bibliotecas para facilitar o uso de autenticação por uma aplicação Rails. Neste guia, usaremos a biblioteca `devise`.

Adicione as seguinte linhas ao arquivo `Gemfile`:

```ruby
gem 'devise'
gem 'devise-i18n'
```

Baixe as novas dependências:

```
$ bundle install
```

(Se você ainda não [configurou sua aplicação para usar mensagens em português](rails-i18n), essa é uma boa hora para configurar!)

O devise gera as páginas de login automaticamente pra você, com model, view e controller:

```
$ rails generate devise:install
$ rails generate devise:i18n:views
$ rails generate devise user
$ rake db:migrate
```

Reinicie a aplicação.

A página de login fica em `/users/sign_in`.

## Criando um controller de exemplo

Vamos criar um controller para exemplificar o login na aplicação:

```
$ rails generate controller home
```

Edite `app/controllers/home_controller.rb` para ficar assim:

```ruby
class HomeController < ApplicationController
  def index
    render text: 'oi'
  end
end

```

Edite o `config/routes.rb` para redirecionar a página inicial para a ação `index` do controlador que você acabou de criar, inserindo a seguinte linha dentro de `Rails.application.routes.draw`:

```ruby
root to: "home#index"
```

## Restringindo o acesso a toda a aplicação

Edite `app/controllers/application_controller.rb`, colocando a seguinte linha no final da definição da classe:

```ruby
before_action :authenticate_user!
```

Com isso, o método `authenticate_user!` vai ser chamado antes de qualquer ação de qualquer controlador. O método checa se o usuário está autenticado; se não tiver, redireciona para a página de login.

## Restringindo o acesso a ações específicas

Se quiser restringir o acesso apenas a algumas ações, remova o `before_action :authenticate_user!` do `ApplicationController` e chame o método dentro das ações que você quiser restringir. Exemplo:

```ruby
# app/controller/home_controller.rb
class HomeController < ApplicationController
  def index
    render text: 'oi'
  end

  def secreto
    authenticate_user!
    render text: "Oi, #{current_user.username}"
  end
end
```

Note que você pode acessar o objeto do usuário atual chamando o método `current_user`.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/secreto', to: "home#secreto"
end
```

No navegador, acesse o caminho `/` da sua aplicação -- você deve conseguir acessar sem problema. Agora acesse `/secreto`. Você será redirecionado para a página de login.

## Autenticação com a UFBA

Adicione a gem:

```ruby
gem 'devise_cas_authenticatable'
```

Atualize:

```
$ bundle install
```

Edite `app/models/user.rb`, trocando por `:database_authenticatable` por `:cas_authenticatable`.

Configure em `config/initializers/devise.rb`:

```ruby
config.cas_base_url = "https://autenticacao.ufba.br/ca"
```

Rode:

```
$ rails generate migration add_username_to_users username:string
$ rails generate migration add_password_to_users password:string
$ rake db:migrate
```

OBS.: para testar esse tipo de autenticação, sua aplicação deve estar rodando sob uma URL acessível de qualquer computador (por exemplo, não pode ser `localhost`, que só seu computador acessa).

## Mais informações:

<http://www.maujor.com/railsgirlsguide/devise.php>

