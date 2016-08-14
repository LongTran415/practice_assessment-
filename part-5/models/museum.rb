class Museum
  attr_accessor :name, :website
  attr_reader :exhibitions

  def initialize(args = {})
    @name = args.fetch(:name)
    @website = args.fetch(:website)
    @exhibitions = []
  end

  def add_exhibition(exhibition)
    exhibitions << exhibition
  end

end