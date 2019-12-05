require_relative "book"
require_relative "movie"
require_relative "disk"

class ProductCollection
  TYPES = [
    { klass: Book, dir: "books" },
    { klass: Movie, dir: "movies" },
    { klass: Disk, dir: "disks"}
  ].freeze

  def self.from_dir(dir_path)
   products = []

    TYPES.each do |type|
      Dir[File.join(dir_path, type[:dir], "*.txt")].each do |file_path|
        products << type[:klass].from_file(file_path)
      end
    end

    new(products)
  end

  def initialize(products)
    @products = products
  end

  def sort!(by: :title, order: :asc)
    case by
    when :title
      @products.sort_by!(&:title)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    end

      @products.reverse! if order == :desc

      self
  end

  def to_a
    @products
  end

  def to_s
    @products.map.with_index(1) { |product, index| "#{index}. #{product}" }.join("\n")
  end

end
