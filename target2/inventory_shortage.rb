class InventoryShortage
  attr_accessor :table

  def initialize
    @table = Array.new
  end

  def append(param)
    @table.append(param)
  end
end
