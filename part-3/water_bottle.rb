require_relative 'reservations'

class WaterBottle < CampingGear
  attr_reader :capacity, :material

  include Reservations

  def initialize(args = {})
    @capacity = args.fetch(:capacity) { 2 }
    @material = args.fetch(:material) { "tin" }
  end

end
