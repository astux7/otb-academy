require 'capybara/cucumber'
require 'checkout'

Capybara.app = Sinatra::Application
Sinatra::Application.set :product_list, InMemoryProductList.new