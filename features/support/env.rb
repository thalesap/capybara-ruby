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


begin Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, 
    browser: :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {"args" => %w{--log-level=3 --disable-web-security --no-sandbox --start-maximized --disable-print-preview}}))
    end
Capybara.default_driver = :chrome
#Capybara.default_driver = :selenium
#Capybara.page.current_window.resize_to(1366,740)
Capybara.default_max_wait_time = 25 
end 


#======Executa os testes em HEADLESS MODE=========  

=begin 
begin Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(app, 
  browser: :chrome,
  :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {"args" => %w{--headless --window-size=2000,5000 --log-level=3 --disable-web-security --no-sandbox --disable-print-preview}}))
  end
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.default_max_wait_time = 45
end
=end