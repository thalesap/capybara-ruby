# language: pt

Dado(/^usuário faz login$/) do
  
  @login = LoginPage.new
  @login.load
  @login.with('capybara@jbnote.com', '123456', 'capybara')
  
end

Dado(/^os seguintes atributos:$/) do |table|
  
  @user = table.rows_hash['email']
  @pwd = table.rows_hash['senha']
  @dominio = table.rows_hash['dominio']
end

Dado("que eu tenho um {string}, {string} e {string}") do |email, password, dominio|
  @user = email
  @pwd = password
  @dominio = dominio
end

Quando(/^faço o login$/) do
  
 @login = LoginPage.new
 @login.load
 @login.loga(@user,@pwd,@dominio) 
end

Então(/^eu acesso o sistema$/) do
  
  sleep 5
  find('.btn.btn-mes-atual.btn-primary')
  
end


Então(/^eu vejo a mensagem "([^"]*)"$/) do |message|
  puts message
  expect(page).to have_content(message)
  #Capybara.reset_session!
end
