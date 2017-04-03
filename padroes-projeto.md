---
layout: page
title:  "Padrões de projeto"
date:   2017-03-03 20:20:00 -0300
categories: aula
---

Padrões de projeto são soluções reusáveis para problemas recorrentes no projeto (*design*) de software. Os padrões não são soluções prontas, e sim modelos que precisam ser adaptados para cada situação específica. Os primeiros padrões de projeto de software foram catalogados no livro "Design Patterns: Elements of Reusable Object-Oriented Software", conhecido como GoF (*Gang of Four*, em referência a seus quatro autores).

No GoF, os padrões de projeto são classificados da seguinte forma:

- De acordo com o propósito:
    - Criacionais: lidam com a criação de objetos
    - Estruturais: concretizam relacionamentos entre diferentes classes
    - Comportamentais: definem implementações e comunicação entre objetos
- De acordo com o escopo:
    - Classe: usa herança entre classes
    - Objeto: usa composição entre objetos

Cada padrão de projeto deve possuir ao menos um nome, um problema/motivação, uma estrutura (como aplicar o padrão), e consequências de sua aplicação (prós e contras). O catálogo GoF possui outras informações sobre os padrões, como exemplos, lista de padrões relacionados, usos conhecidos, entre outros.

Além dos padrões de projeto, o GoF define alguns princípios para elaborar bons projetos de software:

- Separe as coisas que mudam das coisas que permanecem iguais
- Programe para uma interface, não para uma implementação
- Prefira composição no lugar de herança
- Use delegação

Na disciplina, estudaremos os seguintes padrões:

- Criacionais:
    - Factory Method (de classe)
    - Abstract Factory
- Comportamentais:
    - Template Method (de classe)
    - Strategy
    - Observer
- Estruturais:
    - Adapter (de classe ou de objeto)
    - Composite
    - Decorator

(Os padrões de classe estão indicados na lista; os demais são padrões de objeto.)

## Referências online

- [Catálogo De Padrões De Projeto (projeto APRI)](http://www.dpi.ufv.br/projetos/apri/?page_id=519)
- Curso - Padrões de Projeto (Prof. Vítor Souza, UFES): [introdução](http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/java-br-curso-padroesdeprojeto-slides01.pdf), [criação](http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/java-br-curso-padroesdeprojeto-slides02.pdf), [estrutura](http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/java-br-curso-padroesdeprojeto-slides03.pdf), [comportamento](http://www.inf.ufes.br/~vitorsouza/wp-content/uploads/java-br-curso-padroesdeprojeto-slides04.pdf)
- [Projeto de software orientado a objeto (Prof. Jacques Sauvé, UFCG)](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/map2.htm): [observer](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/arqu/observer.htm), [strategy](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/strategy.htm), [template method](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/template.htm), [factory method](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/factory.htm), [abstract factory](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/abstractfactory.htm), [composite](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/composite.htm), [decorator](http://www.dsc.ufcg.edu.br/~jacques/cursos/map/html/pat/decorator.htm) (há outros na seção 4)
