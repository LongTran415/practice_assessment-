require_relative 'reservations'

class Tent < CampingGear
  attr_reader :capacity

  include Reservations

  def initialize(args = {})
    @capacity = args.fetch(:capacity) { 3 }
  end

end
