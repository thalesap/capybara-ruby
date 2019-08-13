Repositório de testes automatizados end-to-end utilizando os frameworks Cucumber e Capybara na linguagem Ruby.
usando como base o cadastro de usuario 'https://automacaocombatista.herokuapp.com/'

## Setup local
* Realizar clone do projeto
* Tenha instalado Chrome e/ou Firefox
* Instalar o chromedriver*  
* Instalar o ruby*
* instalar o bundler `gem install bundler`
* Instalar as dependencias do projeto `bundle install`


*para instalações em Windows utilizar o https://chocolatey.org/


## Execução local
* Acessar raiz do projeto `\cucumber-capybara-sma-portal` pelo prompt
* Executar o comando `cucumber -p <ambiente> -p no_headless`


## Execução CI definindo o ambiente
* Acessar CI/CD > Pipelines;
* Run Pipeline;
* Create for `master`
* Variables `ambiente` `homologacao`


## Execução de um cenário especifico

Basta informar o parametro de ambiente e a tag do cenário desejado

`cucumber  -p <ambiente> -p no_headless -t <@tagdocenario>`

Exemplo:
`cucumber -p dev01 -p no_headless -t @densentrenharprocessodigital`

***@tagcenario** pode obtido dentro de cada arquivo.feature do cenário desejado

*O comando `-p ci` pode ser adicionado caso seja necessario gerar o **.json e o html** de relatório do testes executados.

