require_relative 'warehouse_worker'
require_relative 'table'
require_relative 'inventory_shortage'

class Receptionist
  def initialize
    @packing_slip_store = Table.new
    @inventory_shortage_store = Table.new
  end

  # NOTE: warehouse worker から受け取った積荷票を保管しておく
  def receive_packing_slip(packing_slip)
    @packing_slip_store.append(packing_slip)
  end

  def write_inventory_shortage(brand, destination_name, required_quantity)
    inventory_shortage = InventoryShortage.new(brand, destination_name, required_quantity)
    @inventory_shortage_store.append(inventory_shortage)
  end

  def call_requester(requester)
    # TODO: 依頼者に電話
    requester.receive_a_call()
  end

  def calculate_inventory(orders, prepared_stock)
    stock = prepared_stock
    converted_orders = convert_orders(orders)
    response = []
    stock.table.rep.each do |stock_record|
      next if converted_orders[stock_record.brand].nil?
      ordered_quantity = converted_orders[stock_record.brand][:order].quantity
      calc_result = stock_record.quantity - ordered_quantity
      stock_record.quantity = calc_result
      response.append(stock_record, converted_orders[stock_record.brand])
    end
    response
  end

  private

  def convert_orders(orders)
    order_arr = []
    orders.each do |order|
      order_arr.append([order[:order].product_name, order])
    end

    order_arr.to_h
  end
end
