require_relative 'warehouse'
require_relative 'packing_slip'

class WarehouseWorker
  def initialize
    @warehouse = Warehouse.new
  end

  # NOTE: コンテナを倉庫に保管
  def store(container)
    @warehouse.append(container)
    packing_slip = PackingSlip.new(container, Time.zone.now)
    Receptionist.receive_packing_slip(packing_slip)
  end

  # NOTE
end
