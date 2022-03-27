class Form
  def initialize(s, v)
    @customer = s
    @order = Table.initialize_orverloaded(v)
    @prepared = Table.new
    @shortage = Table.new
    @price = 0
  end

  def total_price
    @order.total_price
  end
end
