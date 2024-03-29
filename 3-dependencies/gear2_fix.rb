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

  # Wheel is injected into Gear
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog

    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # dependency removed
    ratio * diameter
  end

  # dependency removed
  # still send message to someone other than `self`
  # but we isolated it into this method
  def diameter
    wheel.diameter
  end
end

inches = Gear.new(21, 11, Wheel.new(26, 1.6)).gear_inches
puts("Inches is " + inches.to_s)