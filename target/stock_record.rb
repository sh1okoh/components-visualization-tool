class StockRecord
  def initialize(brand, q)
    @brand = brand
    @qty = q
  end

  def to_string
    "brand:" + @brand.to_string + ",qty" + @qty.to_s+""
  end
  
  def price
    @brand.price * @qty
  end
end
