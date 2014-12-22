class Question
  attr_accessor :id, :q, :result
  def initialize(params)
    puts "Params #{params.inspect}"
    @params = params
    text = params.split(' ')
    @id = text[0]
    @q = text[1..text.count].join(' ')
    @result = nil
  end

  def identify
    if @q.include? 'which of the following numbers is the largest:'
      LargestNum
    elsif @q.include? 'which of the following numbers is both a square and a cube'
      SquareCube
    elsif /what is (\d*) plus (\d)/.match(@q)
      Sum
    elsif /what is (\d*) minus (\d)/.match(@q)
      Minus
    elsif /which of the following numbers are primes: (.*)/.match(@q)
      PrimeIdentification
    elsif /what is \d{1,3} to the power of \d{1,3}/.match(@q)
      ThePowerOf
    elsif @params.include?('Eiffel tower')
      Tower
    else
      NoIdea
    end
  end


end
