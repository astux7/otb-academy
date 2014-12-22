
require './app/models/square_cube'

describe "SQ" do 
  let(:sq){SquareCube.new("2e31e820: which of the following numbers is both a square and a cube: 861, 658, 400, 1000000")}
  it "should tell is sq or cube numbers" do
    expect(sq.answer).to eq("1000000")
  end
  it "should is square" do
    expect(sq.square(400)).to eq("400")
  end
   it "should tell is cube numbers" do
    expect(sq.cube(1000000)).to eq("1000000")
  end
end