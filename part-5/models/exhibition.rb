class Exhibition
  attr_accessor :name, :description, :date
  attr_reader :artworks, :museum

  def initialize(args = {})
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @date = args.fetch(:date)
    @museum = args.fetch(:museum)
    @artworks = []
  end

  def add_artwork(artwork)
    artworks << artwork
  end

end