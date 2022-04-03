require_relative 'warehouse_worker'

class Receptionist
  def initialize
    @packing_slip_store = Array.new
  end

  # NOTE: warehouse worker から受け取った積荷票を保管しておく
  def receive_packing_slip(packing_slip)
    @packing_slip_store.append(packing_slip)
  end

  def request_delivery
    # とりあえずあてで
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

  private

  def is_inventory_shortage(order, prepared_stock)
    # NOTE: 初期化
    calc_result = 0
    prepared_stock.table.each do |stock_record|
      if stock_record.brand == order[:brand]
        calc_result = stock_record.quantity - order[:quantity]
      end
    end

    calc_result >= 0
  end
end
