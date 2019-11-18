class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

class Gear
  attr_reader :chainring, :cog, :wheel

  # arguments are passed in as hash, order can be preserved
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # dependency removed
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end
end

inches = Gear.new(:chainring => 21, :cog => 11, :wheel => Wheel.new(26, 1.6)).gear_inches
puts("Inches is " + inches.to_s)