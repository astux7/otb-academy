
require "book"

class Discount

  DISCOUNTS = {
    1 => 1.0,
    2 => 0.05,
    3 => 0.1,
    4 => 0.2,
    5 => 0.25
  }

  attr_accessor :basket,:book_selection,:discount_set
  attr_reader :price
  
  def initialize(basket, price)
    @book_selection = []
    @basket = basket
    @discount_set = []
    @price = price
  end

  def best_discount
    book_quantity
    discount_options_calculation
  end

  def book_quantity
    Book::BOOKS.each{ |book|
      quantity = sum(book)
      @book_selection << Book.new(book,quantity) if quantity > 0
    }
    @book_selection.sort_by(&:quantity).reverse
  end

  def sum(book)
    @basket.select{|el| el if book == el}.count
  end

  def discount_options_calculation(last_discount = 0)
    (2..@book_selection.count).each{|level|
      new_discount = caculate_discount(level)
      last_discount = discount_comparison(new_discount,last_discount)
    }
    last_discount
  end
  
  def caculate_discount(level)
    discount_groups_set(level)
    @discount_set.inject(0){|sum, book|
      sum += discount(book)
    }
  end

  def discount_comparison(discount1, discount2)
    discount1 > discount2 ? discount1 : discount2
  end

  def discount_groups_set(level)
    book_list, @discount_set = clone_list, []
    book_list = grouping(book_list, level)
    unless book_list.nil? || book_list.count < 2
      calculate_tail(book_list)
    end
  end

  def clone_list
    @book_selection.collect {|obj| obj.dup }
  end

  def grouping(book_list,level)
    return if tail_left?(book_list, level)
    return if book_list.count < level
    @discount_set << level
    book_list = modify_book_list(level, book_list)
    grouping(book_list,level) if book_list.count >= level
    book_list
   end

  def calculate_tail(book_list)
    while book_list.count > 1
      book_list = grouping(book_list,book_list.count)
    end
  end

  def tail_left?(book_list,level)
    book_left = @basket.count-level*@discount_set.count
    (book_left == level+1) && (book_list.count == level+1)
  end

  def modify_book_list(level, book_list)
    iter = 0
    level.times{
      result = actions_with_book(level,book_list,iter)
      book_list, iter = result[0], result[1] 
    }
    book_list
  end

  def actions_with_book(level,book_list,iter)
    if book_list[iter].quantity == 1
        book_list = remove_book(book_list,iter)
        iter -= 1
      else
        book_list = decrease_book_quantity(book_list, iter)
      end
    [book_list,iter += 1]
  end

  def remove_book(book_list, iter)
     book_list.delete_at(iter)
     book_list
  end

  def decrease_book_quantity(book_list, iter)
     book_list[iter].quantity -= 1
     book_list
  end

  def discount(number_book)
     @price * DISCOUNTS[number_book] * number_book
  end

end