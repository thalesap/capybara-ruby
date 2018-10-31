# encoding: utf-8



Dado(/^que eu quero cadastrar um cliente do tipo simplificada "([^"]*)"$/) do |tipo| 
  @nome = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  puts @nome
  @tipo= tipo
  @estrangeiro = Faker::Bitcoin.address
  @cepend = Faker::Address.postcode
  @numero = Faker::Number.number(4)
  @ddd = Faker::Number.number(2)
  @telefone = Faker::PhoneNumber.phone_number
end

Quando(/^eu cadastro esse cliente$/) do
  @cadastro = CadastroPage.new
  @cadastro.load
  @cadastro.savesimple(@nome, @tipo, @estrangeiro, @cepend, @numero, @ddd, @telefone)
end

Então(/^o sistema deverá persistir na lista de clientes$/) do
  @result = find('a[href*="/clientes/editar/"]', match: :first).text
  puts @result
  @result.should eq(@nome)
end


