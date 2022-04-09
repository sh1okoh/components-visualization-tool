require_relative 'order'

# 依頼者
class Requester
  attr_accessor :name, :company_name

  def initialize(name, company_name)
    @name = name
    @company_name = company_name
  end

  def order(product_name, quantity, destination_name)
    Order.new(product_name, quantity, destination_name)
  end
end