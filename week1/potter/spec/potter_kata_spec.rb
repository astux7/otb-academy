require 'potter_kata'

describe "PotterKata" do 
let(:potter) { PotterKata.new(8)}

  it 'should init price' do
    expect(potter.price).to eq(8)
  end 

  it 'should have books ' do 
    potter.basket = ["Potter1","Potter2","Potter3","Potter1"]
    expect(potter.basket).to eq(["Potter1","Potter2","Potter3","Potter1"])
  end

  it 'checkout' do
    potter.basket = ["Potter1"]
    expect(potter.checkout).to eq(8)
  end

  it 'checkout' do
    potter.basket = ["Potter1","Potter2","Potter3"]
    expect(potter.total).to eq(3*8*0.9)
  end

  it 'checkout' do
    potter.basket = ["Potter1","Potter2","Potter3","Potter1","Potter1"]
    expect(potter.checkout).to eq(3*8*0.9+2*8)
  end
  
  it 'best discount for' do
    potter.basket = [
      "Potter1","Potter1","Potter1",
      "Potter2","Potter2","Potter3",
      "Potter3","Potter3","Potter3",
      "Potter4","Potter4","Potter5"
    ]
    expect(potter.total).to eq(78.8)
  end

  it 'should return object array of density 51.2' do
    potter.basket =[
      "Potter1","Potter2","Potter1",
      "Potter2","Potter3","Potter3",
      "Potter4","Potter5"
    ]
    obj = potter.total
    expect(obj).to eq((8*8) -(8*8*0.2))
  end
 end
