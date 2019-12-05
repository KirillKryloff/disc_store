require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.join(__dir__, "data"))

collection.sort!(by: :price)

basket = []

loop do
  puts
  puts "Что хотите купить?"
  puts
  puts collection
  puts "0. Выход"
  puts
  print "Ваш выбор:"

  user_choice = STDIN.gets.chomp.to_i

  break if user_choice == 0

  chosen_product = collection.to_a[user_choice - 1]

  next unless chosen_product
  if chosen_product.amount > 0
    basket << chosen_product
    chosen_product.amount -= 1

    puts "Вы выбрали: #{chosen_product}"
    puts
    puts "Всего товаров на сумму: #{basket.sum(&:price)}"
  end
end

puts
puts "Вы купили:"
puts basket.join("\n")
puts
puts "С Вас - #{basket.sum(&:price)}. Спасибо за покупки!"
