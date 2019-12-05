class Product
  attr_accessor :price, :amount

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def initialize(price:, amount:, **)
    @price = price.to_i
    @amount = amount.to_i
  end

  def update(price: nil, amount: nil, **)
    @price = price unless price.nil?
    @amount = amount unless amount.nil?

    self
  end

  def to_s
    "Цена #{price} руб. (остаток - #{amount})"
  end
end
