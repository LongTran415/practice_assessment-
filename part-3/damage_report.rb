require_relative 'status'

class DamageReport
  attr_reader :description
  attr_accessor :assigned_employee

  include Status

  def initialize(args = {})
    @description = args.fetch(:description) { "Unknown damage" }
    @resolved = false
  end

end
