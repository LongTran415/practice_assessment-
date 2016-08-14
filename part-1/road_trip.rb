require_relative 'segment'

class RoadTrip
#should I use attr_reader here for name and segments? When would you use attr_reader?
attr_reader :segments
attr_accessor :name

  def initialize(args = {})
    @name = args.fetch(:name, "")
    # args[:miles] => nil
    # @segments = args.fetch(:segments, Segment.new(nil))
    @segments = args.fetch(:segments, [])
  end

  def add_segment(new_segment)
    @segments << new_segment
  end

  def total_miles
    # I have an array of segments and I want to reduce it down to the sum of miles
    # The method I am using to reduce the array is the 'add_miles' method
    @segments.reduce(:add_miles)
  end

  def average_miles_per_segment
    total_miles / @segments.length
  end

end
