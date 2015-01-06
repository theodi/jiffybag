require 'spec_helper'

describe JiffyBag do

  before :all do
    # List of vars to load
    @var_list = %w{
      VARIABLE_ONE
      VARIABLE_TWO
    }
    # Make sure we can specify env files for Dotenv
    @env_files = [
      File.expand_path("../envs/env_one", File.dirname(__FILE__)), 
      File.expand_path("../envs/env_two", File.dirname(__FILE__))
    ]
  end
  
  before :each do
    JiffyBag.reset!
  end
  
  context "basic configuration" do
    
    it "should be configurable with dotenv filenames" do
      JiffyBag.configure @var_list, @env_files
    end
    
    it "should provide a list of available variables" do
      JiffyBag.configure @var_list, @env_files
      expect(JiffyBag.variables).to eql @var_list
    end

    it "should be able to configure multiple times" do
      JiffyBag.configure ["VARIABLE_ONE"], @env_files
      JiffyBag.configure ["VARIABLE_TWO"], @env_files
      expect(JiffyBag.variables).to eql ["VARIABLE_ONE", "VARIABLE_TWO"]
    end
    
    it "should be throw an exception if any specified vars are missing from ENV" do      
      expect { JiffyBag.configure ["VARIABLE_THREE", "VARIABLE_FOUR"], @env_files }.to raise_error JiffyBag::MissingVariable, "VARIABLE_THREE, VARIABLE_FOUR"
    end
      
  end

  context "with environment variables set" do
    
    before :each do
      JiffyBag.configure @var_list, @env_files
    end
    
    it "should provide access to environment variables" do
      expect(JiffyBag["VARIABLE_ONE"]).to eql "foo"
    end
    
    it "should raise an exeception if an unknown variable is accessed" do
      expect { JiffyBag["VARIABLE_THREE"] }.to raise_error JiffyBag::UnknownVariable, "VARIABLE_THREE"
    end

  end
  
end