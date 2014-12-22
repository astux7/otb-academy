
class SquareCube
attr_accessor :q

def initialize(q)
  @q = q
end

def answer
  @q =~  /which of the following numbers is both a square and a cube: (.*)/
  arr = $1.split(', ')
  arr.each {|x|
   
   return x.to_s if !cube(x).nil? && !square(x).nil?
  }
  return "0"
end

def square(x)
 return x.to_s if Math.sqrt(x.to_i)%2==0
 return nil
end
def cube(x)

   return x.to_s if ((x.to_i**(1/3.0)).round) %2 == 0
   return nil

end
end