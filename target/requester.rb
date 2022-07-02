require_relative 'order'

# 依頼者
class Requester
  attr_accessor :name, :company_name

  def initialize(name, company_name)
    @name = name
    @company_name = company_name
    @inventory_shortage_list = Table.new
  end

  def order(product_name, quantity, destination_name)
    Order.new(product_name, quantity, destination_name)
  end

  def receive_a_call(order)
    puts '在庫がない旨を了解しました'
  end
end