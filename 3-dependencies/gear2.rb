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

=begin
  Gear class provides bike related calculations
  Every method only carries one responsibility
=end
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # Dependencies:
    # 1. Gear knows about Wheel
    # 2. Gear depends on Wheel to perform diameter calculation
    # 3. Gear knows the signature  of Wheel's constructor
    # 4. Gear knows the orders of Wheel's constructors parameters
    # 5. Gear can only calculate inches for Wheel
    ratio * Wheel.new(rim, tire).diameter
  end
end

inches = Gear.new(21, 11, 26, 1.6).gear_inches
puts("Inches is " + inches.to_s)