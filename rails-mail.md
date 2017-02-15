---
layout: page
title:  "Rails: E-mail"
date:   2017-02-15 20:20:00 -0300
categories: aula
---

O Rails já vem com suporte a envio de e-mail, mas você precisa configurar algum serviço para efetivar esse envio. Neste guia usaremos o SendGrid.

## Criando a conta

Crie uma conta gratuita no serviço [SendGrid](http://sendgrid.com/).

Crie uma chave. Essa chave é uma senha que sua aplicação usará para se autenticar no serviço, com permissões restritas. Para criar a chave, clique em Settings > API Keys > Create API Key > General API Key. Escolha um nome ilustrativo para essa chave, ative a permissão Mail Send (Full Access) e clique em Save. Uma nova chave será gerada para você. Copie a chave que e a guarde em um lugar seguro, pois do contrário você não conseguirá recuperar a chave.

## Configurando a aplicação

Edite o arquivo `config/environment.rb` para incluir a seguinte configuração:

```ruby
ActionMailer::Base.smtp_settings = {
  :user_name      => 'apikey',
  :password       => ENV['SENDGRID_API_KEY'],
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
} 
```

Note que não colocamos a chave no arquivo de configuração; em vez disso, a aplicação vai obter essa chave a partir de uma variável de ambiente. Para definir a variável de ambiente, execute o seguinte comando:

```
$ export SENDGRID_API_KEY=xxxx
```

Obviamente, troque `xxxx` pela sua chave. Note que você precisará executar esse comando no terminal em que você rodar o comando `rails server`. Você também precisará configurar essa chave no Heroku, como veremos adiante.

Também edite o arquivo `app/mailers/application_mailer.rb`, alterando a linha:

```ruby
default from: 'from@example.com'
```

Troque `from@example.com` pelo e-mail que você quer que apareça como remetente das mensagens enviadas pela aplicação.

## Criando um controller de exemplo

Vamos criar um controller para exemplificar o envio de e-mail na aplicação:

```
$ rails generate controller home
```

Edite `app/controllers/home_controller.rb` para ficar assim:

```ruby
class HomeController < ApplicationController
  def index
    render plain: 'oi'
  end
end
```

Edite o `config/routes.rb` para redirecionar a página inicial para a ação `index` do controlador que você acabou de criar, inserindo a seguinte linha dentro de `Rails.application.routes.draw`:

```ruby
root to: "home#index"
```

## Criando mailers

Mailers são como controllers: eles contêm lógica e ao final renderizam uma view; a diferença é que, em vez de retornar a view para o navegador, essa view é o conteúdo do e-mail que é enviado.

Crie um mailer:

```
$ rails generate mailer home
```

Edite o arquivo `app/mailers/home_mailer.rb`:

```ruby
class HomeMailer < ApplicationMailer
  def email_boas_vindas(nome, sobrenome, email)
    @nome = nome
    @sobrenome = sobrenome
    @email = email

    mail to: @email,
         subject: 'Boas vindas'
  end
end
```

As variáveis de instância (começadas por `@`) podem ser acessadas pela view.

Você pode criar quantos métodos quiser no seu Mailer. Para enviar um e-mail, edite o `app/controllers/home_controller.rb`:

```ruby
class HomeController < ApplicationController
  def index
    HomeMailer.email_boas_vindas('Fulano', 'de Tal', 'fulano@example.com').deliver_now
    render plain: 'oi'
  end
end
```

(Troque `fulano@example` pelo seu e-mail para você poder testar.)

Além disso, você precisa definir o corpo da mensagem. Crie o arquivo `app/views/home_mailer/email_boas_vindas.text.erb` com o seguinte conteúdo:

```
Olá, <%= @nome %> <%= @sobrenome %>! Desejamos boas-vindas a você!
```

Você também pode criar um arquivo `app/views/home_mailer/email_boas_vindas.html.erb` para definir o corpo da mensagem no formato HTML.

Por fim, se você quiser mudar o layout que será aplicado a todas as mensagens de e-mail, edite os arquivos `app/views/layouts/mailer.txt.erb` e `app/views/layouts/mailer.html.erb`.

## Executando a aplicação

Lembre-se de definir a variável de ambiente com a chave do SendGrid:

```
$ export SENDGRID_API_KEY=xxxx
```

(Obviamente, troque `xxxx` pela sua chave.)

Então execute o servidor Rails e abra sua aplicação no navegador. Fique de olho no log da aplicação pra ver se deu algum erro no envio de e-mail e cheque sua caixa de entrada.

## Configurando o Heroku

Para definir a variável `SENDGRID_API_KEY` no ambiente do Heroku, execute:

```
$ heroku config:set SENDGRID_API_KEY=xxxx
```

(Obviamente, troque `xxxx` pela sua chave.)

(Assumindo que seu projeto já está configurado com o Heroku.)

