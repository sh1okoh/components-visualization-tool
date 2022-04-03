require_relative 'warehouse'
require_relative 'packing_slip'

class WarehouseWorker
  def initialize
    @warehouse = Warehouse.new
  end

  # NOTE: コンテナを倉庫に保管
  def store(container)
    @warehouse.append(container)
  end

  def ship(built_in_product)
  end
end
