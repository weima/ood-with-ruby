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

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    # isolate wheel creation, this is a compromise in case we could not change the signature of Constructor
    @wheel = Wheel.new(rim,tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  def diameter
    # dependency removed
    # still send message to someone other than `self`
    # but we isolated it into this method
    wheel.diameter
  end
end

inches = Gear.new(21, 11, 26, 1.6).gear_inches
puts("Inches is " + inches.to_s)