class InventoryShortage
  def initialize
    @store = Array.new
  end

  def put(param)
    @store.append(param)
  end
end
