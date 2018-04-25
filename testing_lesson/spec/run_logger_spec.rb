#for example only
require "run_logger" #file doesn't exist

describe Run do

  describe "attributes" do
    subject do    #declaring subject as instance of class Run
    end
      Run.new(:duration => 32,
              :distance => 5.2
              :timestamp => "2014-12-22 20:30")
    end

    it { is_expected.to respond_to(:duration) }
    it { is_expected.to respond_to(:distance) }
    it { is_expected.to respond_to(:timestamp) }
  end
end
 
