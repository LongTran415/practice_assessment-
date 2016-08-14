class Artwork
  attr_accessor :title, :date
  attr_reader :mediums, :exibitions, :artist

  def initialize(args = {})
    @artist = args.fetch(:artist)
    @title = args.fetch(:title)
    @date = args.fetch(:date)

    @exibitions = []
    @mediums = []
  end

  def add_exibition(exibition)
    exibitions << exibition
  end

  def add_medium(medium)
    mediums << medium
  end

end