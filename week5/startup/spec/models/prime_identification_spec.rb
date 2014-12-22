require_relative '../../app/models/prime_identification'

describe PrimeIdentification do

  subject { PrimeIdentification.new(question).answer }

  context 'which of the following numbers are primes: 7, 250' do
    let(:question) { "which of the following numbers are primes: 7, 250"}

    it 'returns the prime number' do
      expect(subject).to eql("7")
    end
  end

  context "22447170: which of the following numbers are primes: 133, 463" do
    let(:question) { "22447170: which of the following numbers are primes: 133, 463" }

    it 'returns the prime number' do
      expect(subject).to eql("463")
    end
  end
end
