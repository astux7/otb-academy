require './app/models/largest_num'

describe "Largest num" do 
  let(:largenum){LargestNum.new('b1d91fb0: which of the following numbers is the largest: 51, 87')}

  it 'should return largest no' do
    expect(largenum.answer).to eq("87")
  end
end