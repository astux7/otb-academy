require 'prime'

class PrimeIdentification
  def initialize(question)
    @question = question
  end

  def answer
    numbers.select {|num| Prime.instance.prime?(num.to_i) }.first.to_s
  end

  def numbers
    @question =~ /which of the following numbers are primes: (.*)/
    $1.split(',').map(&:to_i)
  end

end
