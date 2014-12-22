require './app/models/largest_num'
require './app/models/sum'
require './app/models/question'
require './app/models/prime_identification'
require './app/models/tower'
require './app/models/the_power_of'
describe "questions" do
  let(:ques){Question.new('b1d91fb0: which of the following numbers is the largest: 51, 87')}
  let(:ques2){Question.new('b1d91fb0: what is 4 plus 4')}

  it 'should remove top prefix' do
    ques.identify
    expect(ques.q).to eq('which of the following numbers is the largest: 51, 87')
  end

  it 'should send the question to max' do
    expect(ques.identify).to eq(LargestNum)
  end

  it 'should send the question to sum' do

    expect( ques2.identify).to eq(Sum)
  end

  context 'primes' do
    let(:question) { "22447170: which of the following numbers are primes: 133, 463" }

    it 'findes the prime' do
      expect(Question.new(question).identify).to eql(PrimeIdentification)
    end
  end

  context 'Tower' do
    let(:question) {
      "1173c920: which city is the Eiffel tower in"
    }

    it '' do
      expect(Question.new(question).identify).to eql(Tower)
    end
  end

  context 'Power of' do
    let(:question) {
      "85e9e740: what is 16 to the power of 17"
    }

    it '' do
      expect(Question.new(question).identify).to eql(ThePowerOf)
    end
  end
end
