Given(/^a known item$/) do
  
  Sinatra::Application.settings.product_list.add_product(Product.new("abc1234", 5.99))
  self.last_item = Product.new("abc1234", 5.99)
end

When(/^the cashier scans the item$/) do
  visit "/scan/?q="+self.last_item.barcode
end

Then(/^the item should be added to the total$/) do
  page.should have_content("5.99")
end

Given(/^an unknown item$/) do
  self.last_item = Product.new("nnf234", 5.99)
end

Then(/^the cashier should be notified that the item is not recognised$/) do
  page.should have_content("Invalid item")
end

module Helper
  def last_item=(item)
    @last_item = item
  end
  def last_item
    @last_item
  end
end

World(Helper)