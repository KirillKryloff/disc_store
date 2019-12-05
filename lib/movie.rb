class Movie < Product
  attr_accessor :title, :year, :director

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)
    new(
      title: content[0],
      director: content[1],
      year: content[2],
      price: content[3],
      amount: content[4]
    )
  end

  def initialize(title:, year:, director:, **)
    super
    @title = title
    @year = year
    @director = director
  end

  def update(title: nil, year: nil, director: nil, **)
    super

    @title = title unless title.nil?
    @year = year unless title.nil?
    @director = director unless title.nil?

    self
  end

  def to_s
    "Фильм #{title}, #{year}, реж. #{director}, #{super}"
  end
end
