#language: pt
# encoding: utf-8
Funcionalidade: Efetuar login
Como usuário do sistema
Quero poder acessar o sistema
Para que eu possa utilizar o sistema

@login
Cenário: login com sucesso
Dado os seguintes atributos:
           | email |capybara@jbnote.com|
           | senha |       123456      |
           |dominio|      capybara     |
Quando faço o login
Então eu acesso o sistema

@inv
Esquema do Cenario: tentativa login
Dado que eu tenho um <email>, <password> e <dominio>
Quando faço o login
Então eu vejo a mensagem <message>
Exemplos:
            |              email             |password|      dominio      |         message         |
            |      "capybara@jbnote.com"     |  "124" |     "capybara"    |    "Senha incorreta"    |
            |     "adm@olenka.com.br.net"    |  "123" |     "capybara"    | "Usuário não encontrado"|
            |    "adm$olenka.com.br.hiper"   |  "123" |     "capybara"    | "Usuário não encontrado"|
            |     "thales_ap@hotmail.com"    |   ""   |     "capybara"    |     "Senha inválida"    |
            |               ""               |  "123" |     "capybara"    |    "Usuário inválido"   |
            |  "thales_ap@hotmail.com.hiper" |  "123" |       "prod"      |"Sua assinatura expirou!"|
           #| "milenereis765@gmail.com.hiper"|  "123" |"Usuário bloqueado"|                         |
           #|"pradas@infocontab.com.br.hiper"|  "123" | "Conta cancelada" |                         |
