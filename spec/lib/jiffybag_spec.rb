require 'spec_helper'

describe JiffyBag do
  
  context "with environment variables set" do
    
    before :all do
      # Environment vars
      ENV["VARIABLE_ONE"] = "foo"
      ENV["VARIABLE_TWO"] = "bar"
      # List of vars
      @var_list = %w{
        VARIABLE_ONE
        VARIABLE_TWO
      }
    end
    
    it "should be configurable" do
      JiffyBag.configure @var_list
    end
    
    it "should provide a list of available variables" do
      JiffyBag.configure @var_list
      expect(JiffyBag.variables).to eql @var_list
    end

    it "should provide access to environment variables" do
      expect(JiffyBag["VARIABLE_ONE"]).to eql "foo"
    end
    
    it "should raise an exeception if an unknown variable is accessed" do
      expect { JiffyBag["VARIABLE_THREE"] }.to raise_error JiffyBag::UnknownVariable, "VARIABLE_THREE"
    end

  end
  
end