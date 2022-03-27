require_relative 'warehouse'
require_relative 'packing_slip'

class WarehouseWorker
  def initialize; end

  # NOTE: コンテナを倉庫に保管
  def store(container)
    warehouse = Warehouse.new
    warehouse.append(container)
    packing_slip = PackingSlip.new
  end

  # NOTE
end
