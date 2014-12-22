require 'discount'

describe "Discount" do 
let(:discount) { Discount.new(["Potter1","Potter2","Potter3","Potter4" ],8)}

  it 'should init with price' do
    expect(discount.price).to eq(8)
  end 

  it 'should return discount' do
     obj = discount.discount(4)
     expect(obj).to eq(4*8*0.2)
  end

  it 'should return quantity groups for 2' do
    discount.basket = [
      "Potter1", "Potter1",
      "Potter2","Potter2",
      "Potter3"
     ]
    discount.book_quantity
    discount.discount_groups_set(2)
    expect(discount.discount_set).to eq([2,3])
  end

  it 'should return quantity groups for 3' do
   discount.basket = [
      "Potter1", "Potter1",
      "Potter2","Potter2",
      "Potter3","Potter4"
     ]
    discount.book_quantity
    discount.discount_groups_set(3)
    expect(discount.discount_set).to eq([3,3])
  end

   it 'should return quantity groups for 4' do
    discount.basket = [
     "Potter1", "Potter1",
      "Potter2","Potter2",
      "Potter3","Potter3",
      "Potter4", "Potter5",
      "Potter5", "Potter2"
      ]
    discount.book_quantity
    obj = discount.discount_groups_set(4)
    expect(discount.discount_set).to eq([4,4,2])
  end

  it 'should return best discount' do
    discount.basket = ["Potter1","Potter2","Potter2","Potter1"]
    obj = discount.best_discount
    expect(obj).to eq(8*4*0.05)
  end

  it 'should return best discount' do
    discount.basket =[
      "Potter1","Potter2",
      "Potter3","Potter1",
      "Potter2", "Potter3",
      "Potter4", "Potter5"
     ]
    obj = discount.best_discount
    expect(obj).to eq(8*8*0.2)
  end

end
