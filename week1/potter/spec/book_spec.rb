require 'book'

describe "Book" do 
let(:book) { Book.new("Potter1",4)}

  it 'should init with quantity' do
    expect(book.quantity).to eq(4)
  end 

  it 'should init with title too' do
     expect(book.title).to eq("Potter1")
  end

end
