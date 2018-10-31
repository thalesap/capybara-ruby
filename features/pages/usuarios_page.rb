class UsuarioPage < SitePrism::Page
    set_url '/users/new'
    element :name, 'input[name="user[name]"]'
    element :last_name, 'input[name="user[lastname]"]'
    element :email, 'input[name="user[email]"]'
    element :address, 'input[name="user[address]"]'
    element :university, 'input[name="user[university]"]'
    element :job, 'input[name="user[profile]"]'
    element :gender, 'input[name="user[gender]"]'
    element :age, 'input[name="user[age]"]'
    element :save_button, 'input[type="submit"]'

    def usuario_save(name,last_name,email,address,university,job,gender,age)
        self.wait_until_name_visible
        self.name.set name
        self.last_name.set last_name
        self.email.set email
        self.address.set address
        self.university.set university
        self.job.set job
        self.gender.set gender
        self.age.set age
        self.save_button.click
        
    end
end  