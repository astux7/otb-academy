class LargestNum

attr_accessor :q

def initialize(q)
  @q = q
end

def answer
  @q =~ /which of the following numbers is the largest: (\d*), (\d*)/
  num_one = $1.to_i
  num_two = $2.to_i
  [num_one, num_two].sort.last.to_s
end

end
