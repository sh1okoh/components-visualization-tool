class Brand
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_string
    return "(" + @name + "," + ")" + @price.to_s + ")"
  end

  def key
    return @name
  end
end
