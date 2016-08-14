class CampingGear

  def initialize(args = {})
    @name = args.fetch(:name) {""}
    @capacity = args.fetch(:capacity) { 0 }
    @material = args.fetch(:material) { "" }
  end

  def damaged?
    @damaged
  end

  def record_damage
    @damaged = true
  end

  def repair
    @damaged = false
  end


end
