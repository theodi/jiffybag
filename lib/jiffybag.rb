require "jiffybag/version"
require "jiffybag/exceptions"

module JiffyBag
  
  def self.configure(variables)
    @@variables ||= []
    @@variables.concat variables
    check_variables
  end
  
  def self.reset!
    @@variables = []
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

private

  def self.check_variables
    missing = []
    @@variables.each do |var|
      missing << var if !ENV.has_key?(var)
    end
    unless missing.empty?
      raise JiffyBag::MissingVariable.new(missing.join(', '))
    end
  end
  
end
