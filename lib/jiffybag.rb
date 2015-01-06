require "jiffybag/version"

module JiffyBag
  
  def self.configure(variables)
    @@variables = variables
  end
  
  def self.variables
    @@variables
  end
end
