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

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
HEADLESS = ENV['HEADLESS']

begin Capybara.register_driver :chrome do |app|
  if HEADLESS.eql?('no_headless') 
    Capybara::Selenium::Driver.new(app, browser: :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {"args" => %w{ --start-maximized --log-level=3 --disable-web-security --no-sandbox --disable-print-preview --disable-dev-shm-usage}}))  

#======Executa os testes no chrome HEADLESS MODE=========  

  elsif HEADLESS.eql?('headless')
    ENV['DOWNLOADPATH'] = '/var/jenkins_home/workspace/TestesAutomatizadosCPA/testes-automatizados-cpa/cucumber-capybara-cpa'
  
    Capybara::Selenium::Driver.new(app, browser: :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {"args" => %w{ --headless --disable-gpu  --window-size=2000,2500 --log-level=3 --disable-web-security --no-sandbox --disable-print-preview --disable-dev-shm-usage}}))  
    
  end
end
  Capybara.configure do |config|
    config.default_driver = :chrome
    config.default_max_wait_time = 30 
  end 
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
