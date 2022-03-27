class WarehouseWorker
  def initialize; end

  # NOTE: コンテナを倉庫に保管
  def store(container)
    warehouse = Warehouse.new
    warehouse.append(container)

  end

  # NOTE:
end
