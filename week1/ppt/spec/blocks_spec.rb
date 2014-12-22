require 'blocks'

describe "BLOCKS" do 

  it 'should give example how map works' do
  #   First, we send the map! method to an Array with a block of code.
  #   The code block interacts with a variable(key) used within the map! method and *2.
  #   Each element inside the array is now increase by 2 times.
    expect(blocks_1).to eq([2,4,6])
  end  

  it 'should give example how each works' do
    expect(blocks_2).to eq("this is ")
  end

  it 'should give example how block dont work' do
    expect{ blocks_3 }.to raise_error(LocalJumpError)
  end

  it 'should give example how block work' do
    expect(blocks_3 { 3 } ).to eq(3)
  end
end

describe "LAMBDA" do
  it 'should explain lambda 1' do
    expect(lambda_1).to eq("we just returned from the calling method")
  end
  it 'should be same result in difference way to use lambda' do
    expect(lambda_2).to eq(lambda_3)
  end
end


describe "PROC" do
  it 'should explain proc 1' do
    expect(proc_1).to eq("we just returned from the block")
  end
  it 'should be same result in difference way to use proc' do
    expect(proc_2).to eq(true)
  end
  it 'should raise not argument error' do
    expect{proc_3}.to raise_error(TypeError)
  end

  it 'should raise not argument error' do
    expect(proc_4).to eq([nil,nil])
  end
end