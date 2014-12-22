require "./lib/checkout"
list = InMemoryProductList.new

list.add_product Product.new('abc124', 10.99)
list.add_product Product.new('abc125', 11.99)

Sinatra::Application.set :product_list, list
run Sinatra::Application

