class Order
  attr_accessor :product_name, :quantity, :destination_name

  def initialize(product_name, quantity, destination_name)
    @product_name = product_name
    @quantity = quantity
    @destination_name = destination_name
  end
end
