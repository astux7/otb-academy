class ThePowerOf
  def initialize(question)
    @question = question
  end

  def answer
    @question =~ /what is (.*) to the power of (.*)/
    ($1.to_i ** $2.to_i).to_s
  end
end
