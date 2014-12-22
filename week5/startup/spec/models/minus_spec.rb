require './app/models/minus'

describe "minus" do 
  let(:min){Minus.new('86de39f0: what is 17 minus 13')}
  it "should - numbers" do
    expect(min.answer).to eq("4")
  end
end