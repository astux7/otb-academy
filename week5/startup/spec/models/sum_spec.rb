require './app/models/sum'

describe "sum" do 
  let(:sum){Sum.new('b1d91fb0: what is 4 plus 4')}
  it "should sum numbers" do
    expect(sum.answer).to eq("8")
  end
end