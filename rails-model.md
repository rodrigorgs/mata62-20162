---
layout: page
title:  "Rails: ActiveRecord (model)"
date:   2017-01-11 20:20:00 -0300
categories: aula
---

Ver <http://guides.rubyonrails.org/active_record_basics.html>

Criação do modelo
=================

Nos exemplos a seguir, linhas começadas por `$` são comandos que devem ser executados no terminal do Linux. Linhas começadas por `>` são comandos do rails console.

```
$ rails generate model disciplina codigo:string nome:string
$ cat app/models/disciplina.rb
$ cat db/migrate/*.rb
$ cat db/schema.rb
$ rails db:migrate

```

Manipulação de registros
========================

```
$ rails console
> # Criacao
> Disciplina.create codigo: 'MATA62', nome: 'Engenharia de Software I'
> Disciplina.create codigo: 'MATA56', nome: 'Paradigmas de Ling Prog'

> disc = Disciplina.new
> disc.codigo = 'MATA63'
> disc.nome = 'Engenharia de Software II'
> disc.save

> # Consulta
> Disciplina.all
> Disciplina.first
> Disciplina.find_by codigo: 'MATA62'
> Disciplina.all.order(codigo: :asc)

> # Atualização
> disc = Disciplina.first
> disc.nome = "abc" + disc.nome
> disc.save

> disc = Disciplina.first
> disc.update(codigo: 'abc', nome: 'def')

> # Remoção
> Disciplina.find_by(codigo: 'MATA56').destroy
```

Validações
==========

Crie uma regra de validação no arquivo do model:

    # app/models/disciplina.rb
    class Disciplina < ApplicationRecord
      validates :codigo, presence: true
    end

```
$ rails console
> Disciplina.create nome: 'Engenharia de Software I'
> Disciplina.create! nome: 'Engenharia de Software I'
> Disciplina.create(nome: 'Engenharia de Software I').valid?
> Disciplina.create(nome: 'Engenharia de Software I').errors[:codigo]

```

Outros exemplos:

```
    # app/models/disciplina.rb
    class Disciplina < ApplicationRecord
      validates :codigo, presence: true, length: { is: 6 }, uniqueness: true
      validates :nome, length: { minimum: 3, maximum: 60 }
    end
```

Guia: <http://guides.rubyonrails.org/active_record_validations.html>

Evolução de modelos (migrations)
================================

```
$ rails generate migration AdicionaCreditosADisciplina
```


    # db/migrate/..._adiciona_creditos_a_disciplina
    class AdicionaCreditosADisciplina < ActiveRecord::Migration[5.0]
      def change
        add_column :disciplinas, :creditos, :integer
      end
    end

Forma alternativa:

    class AdicionaCreditosADisciplina < ActiveRecord::Migration[5.0]
      def change
        change_table :disciplinas do |t|
          t.integer :creditos
        end
      end
    end

```
$ rails db:migrate
```

Guia: <http://guides.rubyonrails.org/active_record_migrations.html>

Relacionamento entre modelos
============================

```
$ rails generate model turma disciplina:references codigo:string
$ rails db:migrate
```

    # app/models/disciplina.rb
    class Disciplina < ApplicationRecord
      has_many :turmas
    end

    # app/models/turma.rb
    class Turma < ApplicationRecord
      belongs_to :disciplina
    end

```
$ rails console
> disc = Disciplina.first
> t = disc.turmas.create(codigo: '01')
> disc.turmas.all
> t.disciplina
```


<!-- 
- Model
	- rails generate scaffold/model
	- rails db:migrate
		- cat db/migrate/*.rb
		- cat db/schema.rb
	- validates_presence_of etc., modelObject.errors
	- rails console
	- ModelClass.create, .create!, .all, .first, .where
	- belongs_to, has_many
- Controller
	- params.required(:comments).permite(:body)


nested routes
-->