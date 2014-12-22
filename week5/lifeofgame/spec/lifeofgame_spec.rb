
class Cell
  attr_reader :status
  attr_accessor :x,:y
  def initialize(status, x = 0, y = 0)
    @status = status
    @x = x
    @y = y
  end
end

class RulesofLife
  def calculate_life(obj, neighbours)
    if obj.status
      if neighbours == 3 || neighbours == 2
        return Cell.new(true,obj.x+1,obj.y)
      end
    else
      if neighbours == 3
        return Cell.new(true,obj.x+1,obj.y)
      end
    end
    Cell.new(false,obj.x+1,obj.y)
  end
  
end 

def Grid
  attr_accessor :cells
  def initialize
    @cells = []
  end 
  def to_s
    # @cells.each{ |cc|
    #  puts  cc.status ==true ?  'o' : 'x'  
    # }
  end
end


describe "Life of ..." do 
  it "cell can change status immutably" do
    cell_obj1 = Cell.new(false)

    cell_obj2 = Cell.new(!cell_obj1.status)
    expect(cell_obj1).not_to eq(cell_obj2) 
  end
  it "should get the status from the neighbours around" do
      neighbours_no = 3
      r = RulesofLife.new
      cell_obj1 = Cell.new(true)
      expect(r.calculate_life(cell_obj1, neighbours_no).status).to eq(true)
  end
    it "should get the status from the neighbours around" do
      neighbours_no = 2
      r = RulesofLife.new
      cell_obj1 = Cell.new(false)
      expect(r.calculate_life(cell_obj1, neighbours_no).status).to eq(false)
  end

   it "should get the status from the neighbours around" do
      neighbours_no = 2
      r = RulesofLife.new
      cell_obj1 = Cell.new(true)
      expect(r.calculate_life(cell_obj1, neighbours_no).status).to eq(true)
  end
   it "should get the status from the neighbours around" do
      neighbours_no = 4
      r = RulesofLife.new
      cell_obj1 = Cell.new(true)
      expect(r.calculate_life(cell_obj1, neighbours_no).status).to eq(false)
  end
end