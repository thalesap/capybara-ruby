# language: pt

Funcionalidade: Cadastrar clientes
Como usuário do sistema
Quero poder cadastrar usuários
Para que eu possa gerenciar meus usuários

#Contexto: Presente na aplicação
# * usuário faz login

@cadastrausuario
Cenário: Cadastro usuario

Dado que eu quero cadastrar um novo usuario
Quando eu cadastro esse usuario
Então o sistema deverá persistir as informações do usuario
