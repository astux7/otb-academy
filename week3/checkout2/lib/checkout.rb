require 'sinatra'
# Sinatra::Application.set :product_list, InMemoryProductList
get '/scan/' do
  barcode =  params[:q]
  # settings.product_list.add_product(Product.new("abc1234", 5.99))
  product = settings.product_list.find_item(barcode)
  if product.nil?
    erb :product_error
  else
    erb :layout1, :locals => {:price => product.price}
  end
end

get '/' do
  erb :home
end
template :layout1 do
  "<div id=\"total\"> <%= price %> </div>"
  # "<div id=\"notfound\"> Item not found </div>"
end

template :product_error do
  "<div id=\"error\">Invalid item</div>"
end

template :home do
  "Hello world!"
end

class Product < Struct.new(:barcode, :price)
end

class InMemoryProductList
  def add_product(product)
    products[product.barcode] = product
  end

  def find_item(barcode)
    products[barcode]
  end

  private
  def products
    @products ||= {}
  end
end

