class Sock
  attr_reader :brand, :style, :color

  def initialize(args = {})
    @brand = args[:brand]
    @style = args[:style]
    @color = args[:color]
  end

  def id
    "#{@brand}:#{@style}:#{@color}"
  end

  def ===(sock)
    # I am doing a deep equals against another sock
    self.brand == sock.brand &&
    self.style == sock.style &&
    self.color == sock.color
  end
end
