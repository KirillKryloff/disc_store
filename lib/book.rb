require_relative "product"

class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)
    new(
      title:  content[0],
      genre:  content[1],
      author: content[2],
      price:  content[3],
      amount: content[4]
    )
  end

  def initialize(title:, genre:, author:, **)
    super
    @title = title
    @genre = genre
    @author = author
  end

   def update(title: nil, genre: nil, author: nil, **)
    super

    @title = title unless title.nil?
    @genre = genre unless title.nil?
    @author = author unless title.nil?

    self
  end

  def to_s
    "Книга #{title}, #{genre}, автор #{author}, #{super}"
  end
end
