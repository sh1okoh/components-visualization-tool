class InventoryShortage
  attr_accessor :brand, :destination_name, :quantity

  def initialize(brand, destination_name, quantity)
    @brand = brand
    @destination_name = destination_name
    @quantity = quantity
  end
end
