
class LoginPage < SitePrism::Page
    
    set_url ''
    #element :username, 'input[placeholder="Usuário ou e-mail"]'
    #element :password, 'input[placeholder="Senha"]' 
    element :username,'input[class="ng-untouched ng-pristine ng-valid"]'
    element :password,  'input[type="password"]'
    element :login_button, 'button[name="enviar"]' 
    element :pagina, 'h2[class="title"]'
    element :dominio, 'input[name="subdominio"]'
    element :dropuser, :xpath, "//li[@class='dropdown usuario button']/a[@class='dropdown-toggle']" #'a[class="dropdown-toggle"]', :text => "Reiko Floripa "
    element :sair, 'a[href="/Home/sair"]'
    element :continuar, 'button[name="undefined"]'
    element :adicionar, 'a.btn.btn-primary.no-margin'
    element :psimple, 'a[href="/produtos/novo/produto-simples"]'
    element :botao_continuar, 'button[name="undefined"]'
    

    def with(u, p,dominio)
        self.dominio.set dominio
        self.botao_continuar.click
        self.wait_until_username_visible
        self.username.set u 
        self.password.set p
        self.login_button.click 
        self.wait_until_pagina_visible 50
    end
    
    def loga(u,p,dominio)  
        self.dominio.set dominio
        self.botao_continuar.click
        self.wait_until_username_visible
        self.username.set u
        self.password.set p
        self.wait_until_login_button_visible 50
        self.login_button.click        
    end

    def prod()
        self.adicionar.click
        self.wait_until_psimple_visible
        self.psimple.click
    
    end
    def logout()
        self.dropuser.click
        self.wait_until_sair_visible
        self.sair.click
    end
end