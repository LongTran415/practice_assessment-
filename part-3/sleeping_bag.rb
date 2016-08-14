require_relative 'reservations'

class SleepingBag < CampingGear
  attr_reader :style, :size, :shell

  include Reservations

  def initialize(args = {})
    super
    @style = args.fetch(:style) { "rectangular" }
    @size = args.fetch(:size) { "adult" }
    @shell = args.fetch(:shell) { "nylon" }
  end

end
