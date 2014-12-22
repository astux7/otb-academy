class Book

  BOOKS = [
    "Potter1",
    "Potter2",
    "Potter3",
    "Potter4",
    "Potter5"
  ]

  attr_accessor :quantity
  attr_reader :title

  def initialize(title,quantity)
    @title = title
    @quantity = quantity
  end
end