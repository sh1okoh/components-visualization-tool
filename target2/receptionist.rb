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
end
