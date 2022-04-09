require_relative 'warehouse_worker'
require_relative 'table'

class Receptionist
  def initialize
    @packing_slip_store = Table.new
  end

  # NOTE: warehouse worker から受け取った積荷票を保管しておく
  def receive_packing_slip(packing_slip)
    @packing_slip_store.append(packing_slip)
  end

  def request_delivery
    # TODO: とりあえずあてで
    {
      product_name: 'product name',
      quantity: 2,
      destination_name: 'destination name'
    }
  end

  # params: { brand: quantity }
  def receive_delivery_request(order, prepared_stock)
    # todo: 在庫不足かどうかの判定
    is_inventory_shortage(order, prepared_stock)
  end

  def calculate_inventory(order, prepared_stock)
    stock = prepared_stock
    stock.table.rep.each do |stock_record|
      if stock_record.brand == order[:brand]
        calc_result = stock_record.quantity - order[:quantity]
        stock_record.quantity = calc_result
      end
    end


    pp "============注文後を差し引いたときの在庫==========="
    stock.to_string
    stock
  end

  class << self
    def contact_to_requester; end

    def append_inventory_shortage(inventory_shortage)
      inventory_shortage_table = Table.new
      inventory_shortage_table.append(inventory_shortage)
    end
  end

  private
end
