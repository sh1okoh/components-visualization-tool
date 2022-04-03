class DeliveryInstruction
  attr_reader :order_number

  def initialize(order_number)
    @order_number = order_number
  end
end
