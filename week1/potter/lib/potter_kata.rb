# 1 copy cost 8€
# where are 5 diff books
# 2 diff books 5% discount on two books
# 3 diff books 10% discount 
# 4 diff books get 20
# 5 diff books 25 %
require 'discount'

class PotterKata

  attr_reader :price
  attr_accessor :basket

  def initialize(price)
    @price = price
    @basket = []
  end

  def checkout
    return 0 if basket.empty?
    total
  end

  def calculate_price
    @basket.count * price
  end

  def total
    discount = Discount.new(basket, price)
    calculate_price - discount.best_discount
  end

end
