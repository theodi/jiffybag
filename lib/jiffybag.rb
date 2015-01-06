require "jiffybag/version"
require "jiffybag/exceptions"

module JiffyBag
  
  def self.configure(variables)
    @@variables = variables
  end
  
  def self.variables
    @@variables
  end
  
  def self.[](variable)
    # Only allow known variables
    raise JiffyBag::UnknownVariable.new(variable) unless @@variables.include?(variable)
    # Grab from ENV
    ENV[variable]
  end
  
end
