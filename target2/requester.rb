require_relative 'order'

# 依頼者
class Requester
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def order(product_name, quantity, destination_name)
    Order.new(product_name, quantity, destination_name)
  end

end