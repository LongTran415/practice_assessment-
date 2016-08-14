require_relative 'status'

class IncidentReport
  attr_reader :description, :reporter
  attr_accessor :assigned_employee

  include Status

  def initialize(args = {})
    @description = args.fetch(:description) { "Unknown damage" }
    @reporter = args.fetch(:reporter) { "anonymous" }
    @resolved = false
  end

end
