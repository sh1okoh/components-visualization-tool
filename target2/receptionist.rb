require_relative 'warehouse_worker'

class Receptionist
  def initialize
    @packing_slip_store = Array.new
  end

  def delivery_request_to_warehouse_worker
    warehouse_worker = WarehouseWorker.new
  end

  # NOTE: warehouse worker から受け取った積荷票を保管しておく
  def store_packing_slip(packing_slip)
    @packing_slip_store.append(packing_slip)
  end
end
