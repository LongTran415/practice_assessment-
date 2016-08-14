class Segment

  attr_reader :origin, :destination, :miles


  def initialize(args = {})
    @origin = args[:origin]
    @destination = args[:destination]
    @miles = args[:miles] || 0
  end

  def add_miles(segment)
    # defined as my miles + argments miles
    self.miles + segment.miles
  end

end
