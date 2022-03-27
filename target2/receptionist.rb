require_relative 'warehouse_worker'

class Receptionist
  def initialize;
  end

  def delivery_request_to_warehouse_worker
    # TODO: 倉庫係に出庫指示
    warehouse_worker = WarehouseWorker.new
  end
end
