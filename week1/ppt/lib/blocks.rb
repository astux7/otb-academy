
def blocks_1
  array = [1,2,3]
  array.map!{|key| 
    key*2
  }
  array
end

def blocks_2
  array, sentence = ["this","is"], ""
  array.each do |word|
    sentence += word+" "
  end
  sentence
end

def blocks_3
  result = yield
  result
end

def lambda_1
 lambda { return "we just returned from the block" }.call
 return "we just returned from the calling method"
end

def lambda_2
  short = ->(a, b) { a + b }
  short.call(2,3)
end

def lambda_3
  long = lambda { |a, b| a + b }
  long.call(2, 3)
end

def proc_1
 Proc.new { return "we just returned from the block" }.call
 return "we just returned from the calling method"
end

def proc_2
  short = proc { |a, b| a + b }
  long = Proc.new { |a, b| a + b }
  long.call(2, 3)==short.call(2, 3)
end


def proc_3
  result = Proc.new { |a, b| a + b }
  result.call(2)
end

def proc_4
  result = Proc.new { |a, b| [a, b] }
  result.call
end