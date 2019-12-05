require_relative "product"

class Disk < Product
  attr_accessor :title, :artist, :genre, :year

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)
    new(
      title:    content[0],
      artist:   content[1],
      genre:    content[2],
      year:     content[3],
      price:    content[4],
      amount:   content[5]
    )
  end

  def initialize(title:, artist:, genre:, year:, **)
    super
    @title = title
    @artist = artist
    @genre = genre
    @year = year.to_i
  end

  def update(title: nil, artist: nil, genre: nil, year: nil, **)
    super

    @title = title unless title.nil?
    @artist = artist unless artist.nil?
    @genre = genre unless genre.nil?
    @year = year unless year.nil?

    self
  end

  def to_s
    "Альбом #{artist} - #{title}, #{genre}, #{year}, #{super}"
  end
end

