# Note: A medium (plural: media) is a
# [material](https://en.wikipedia.org/wiki/List_of_artistic_media) used by an
# artist to create a work of art.

class Medium
  attr_accessor :name, :description
  attr_reader :artworks

  def initialize(args = {})
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @artworks = []
  end

  def add_artworks(artwork)
    artworks << artwork
  end
end
