module Reservations
  def reserve
    @reserved = true
  end

  def end_reservation
    @reserved = false
  end

  def reserved?
    @reserved
  end

  def available?
    !reserved?
  end

end
