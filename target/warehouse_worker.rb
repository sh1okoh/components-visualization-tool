require_relative 'warehouse'
require_relative 'packing_slip'

class WarehouseWorker
  def initialize
    @warehouse = Warehouse.new
  end

  def store(container)
    @warehouse.append(container)
  end
end
