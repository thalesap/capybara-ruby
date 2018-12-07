require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "faker"
require "cpf_faker"
require "rspec"
require "capybara/session" 
require "pry"



Faker::Config.locale = 'pt-BR'

Capybara.app_host = 'https://automacaocombatista.herokuapp.com/'
#Retirando esse register e o default driver eu recebo erro de "rack test requires a rack application"


=begin 
begin Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, 
    browser: :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {"args" => %w{ --log-level=3 --disable-web-security --no-sandbox --start-maximized --disable-print-preview --disable-dev-shm-usage}}))        
    end
Capybara.default_driver = :chrome
#Capybara.page.current_window.resize_to(1366,740)
Capybara.default_max_wait_time = 25 
end 

=end
#======Executa os testes no chrome HEADLESS MODE=========  


begin Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(app, 
  browser: :chrome,
  :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {"args" => %w{ --headless --disable-gpu  --window-size=2000,4000 --log-level=3 --disable-web-security --no-sandbox --disable-print-preview --disable-dev-shm-usage}}))  
    end
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.default_max_wait_time = 25
end


#======Executa os testes no firefox=========  

=begin 
Capybara.default_driver = :selenium
#Capybara.page.current_window.resize_to(1600,900)
Capybara.page.current_window.maximize
Capybara.default_max_wait_time = 25 
=end


#======Executa os testes em firefox HEADLESS MODE=========  

=begin 
Capybara.register_driver :firefox_headless do |app|
    options = ::Selenium::WebDriver::Firefox::Options.new
    options.args << '--headless '
  
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end
Capybara.default_driver = :firefox_headless
Capybara.default_max_wait_time = 25 
=end
