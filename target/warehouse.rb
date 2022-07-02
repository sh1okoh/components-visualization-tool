require_relative 'table'

class Warehouse
  attr_accessor :table

  def initialize
    @table = Table.new
  end

  def append(container)
    @table.append(container)
  end
end
