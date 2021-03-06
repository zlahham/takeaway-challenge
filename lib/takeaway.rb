class Menu
  DISHES = {:burger => 5, :hotdog => 4, :fries => 3, :milkshake => 4, :soda => 3}

  attr_reader :dishes, :basket, :basket_total

  def initialize
    @dishes = DISHES
    @basket = []
    @basket_total = 0
  end

  def list_dishes
    dishes.each {|item, price| puts "#{item.to_s.capitalize} £#{price}"}
    "Enjoy our delicious menu"
  end

  def add_to_basket(item, quantity=1)
    raise "Please order from menu" unless check_for_food(item)
    include_items(item, quantity)
    total(item, quantity)
    [item, quantity]
  end

  private
  
  def total(item, quantity)
    @basket_total = dishes[item]*quantity + basket_total
  end

  def check_for_food(item)
    dishes.has_key?(item)
  end

  def include_items(item, quantity)
    dishes.select {|food, price|quantity.times { basket << {food => price} } if food == item}
  end
end
