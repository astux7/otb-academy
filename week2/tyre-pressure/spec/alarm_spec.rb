require 'alarm'
RSpec.describe "tyre pressure alarm" do
  
  class Notifier
    def initialize
      @methods_called = []
    end
     
    def called?(method_name)
      @methods_called.last == method_name
    end

    def method_missing(method_name, *args, &block)
      method_called_tracker(method_name)
    end

    def method_called_tracker(method_name)
      @methods_called << method_name.to_sym
    end
     
  end 

  let(:notifier){Notifier.new }
  let(:sensor){ double("Sensor", :sample_pressure => sample_pressure)}
  let(:sample_pressure){ 17.8}
  let(:alarm) {Alarm.new(sensor,notifier)}

  it "should init with sensor results" do
    expect(alarm.sensor.sample_pressure).to eq(17.8)
  end

  it 'sensor out_of_bounds not called' do
    alarm.check
    expect(notifier.called?(:out_of_bounds)).to be false
  end

  it 'sensor normal_range called' do
    alarm.check
    expect(notifier.called?(:normal_range)).to be true
  end
  context "creating fake sensor" do
   class FakeSensor
     attr_accessor :sample_pressure
    end 
    let(:sensor){FakeSensor.new }
    it 'should be on and off' do 
      sensor.sample_pressure = 10
      alarm.check
      expect(notifier.called?(:out_of_bounds)).to be true
      # sensor pressure is now normal????
      sensor.sample_pressure = 19
      alarm.check
      expect(notifier.called?(:normal_range)).to be true
    end
  end
end
