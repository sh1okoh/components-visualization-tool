class StockRecord
  attr_accessor :brand, :quantity

  def initialize(brand, quantity)
    @brand = brand
    @quantity = quantity
  end

  def to_string
    pp "#{@brand} : #{@quantity}"
  end
end
