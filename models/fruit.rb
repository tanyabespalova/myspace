class Fruit
  attr_reader :name, :price, :quantity

  def initialize(options)
    @name = options[:name]
    @quantity = options[:quantity]
    @price = options[:price]
  end

  def discount
    @price + @price*0.1
  end

  def to_s
    "name: #{self.name}, quantity: #{self.quantity}, price:#{self.price}"
  end
end