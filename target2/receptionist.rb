require_relative 'warehouse_worker'

class Receptionist
  def initialize
    @packing_slip_store = Array.new
  end

  def delivery_request_to_warehouse_worker(warehouse_worker)
  end

  # NOTE: warehouse worker から受け取った積荷票を保管しておく
  def receive_packing_slip(packing_slip)
    @packing_slip_store.append(packing_slip)
  end

  def request_delivery
    {
      product_name: 'product name',
      quantity: 2,
      destination_name: 'destination name'
    }
  end

  # params: { brand: quantity }
  def receive_delivery_request(brand)
    # todo: 在庫不足かどうかの判定
    is_inventory_shortage(brand)
  end

  private

  def is_inventory_shortage(brand)

  end
end
