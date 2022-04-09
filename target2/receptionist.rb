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
    requester.receive_a_call
  end

  def calculate_inventory(order, prepared_stock)
    stock = prepared_stock
    stock.table.rep.each do |stock_record|
      if stock_record.brand == order.product_name
        calc_result = stock_record.quantity - order.quantity
        stock_record.quantity = calc_result
      end
    end

    pp "============注文後を差し引いたときの在庫==========="
    stock.to_string
    stock
  end

  class << self
    def contact_to_requester; end
  end
end
