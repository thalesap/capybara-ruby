


Dado("que eu quero cadastrar um novo usuario") do
   @criar_usuario =  UsuarioPage.new
   @criar_usuario.load
   
end
  
Quando("eu cadastro esse usuario") do
    @name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @email = Faker::Internet.free_email(@name)
    @address = Faker::Address.street_address
    @university = Faker::University.name
    @job = Faker::Job.title
    @gender = Faker::Gender.binary_type
    @age = Faker::Number.between(10, 85)
    @criar_usuario.usuario_save(@name,@last_name,@email,@address,@university,@job,@gender,@age)
end
  
Então("o sistema deverá persistir as informações do usuario") do
    @result = find('div[class="col s12 center"] p', match: :first).text
    puts @result
    @result.should eq("#{'Nome:'} #{@name}")
end
  