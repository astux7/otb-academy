class Minus
attr_accessor :q

def initialize(q)
  @q = q
end

def answer
  @q =~ /what is (\d*) minus (\d*)/
  ($1.to_i - $2.to_i).to_s
end
end